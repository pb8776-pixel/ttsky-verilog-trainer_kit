# SPDX-License-Identifier: Apache-2.0
# Cocotb test for Digital Trainer Kit

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Initialize
    dut.ui_in.value = 0
    dut.ena.value = 1
    dut.rst_n.value = 1
    dut.uio_in.value = 0

    dut._log.info("Reset done")

    # Test all 4 input combinations for A=ui_in[0], B=ui_in[1]
    expected_truth = {
        (0, 0): [0, 0, 1, 1, 1, 0, 1],
        (1, 0): [0, 1, 0, 1, 0, 1, 0],
        (0, 1): [0, 1, 1, 1, 0, 1, 0],
        (1, 1): [1, 1, 0, 0, 0, 0, 1],
    }

    for a in [0, 1]:
        for b in [0, 1]:
            dut.ui_in.value = (b << 1) | a
            await Timer(1, units="ns")  # let signals settle

            outputs = [int(dut.uo_out[i].value) for i in range(7)]
            dut._log.info(f"A={a} B={b} -> Outputs={outputs}")

            assert outputs == expected_truth[(a, b)], \
                f"Mismatch for A={a}, B={b}: got {outputs}, expected {expected_truth[(a, b)]}"
