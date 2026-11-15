module origen_134645 (
    input wire [3:0] qspi_ui_dq_i,
    input wire dut_io_pads_qspi_cs_0_o_oval,
    input wire dut_io_pads_qspi_dq_3_o_oval,
    input wire dut_io_pads_qspi_dq_2_o_oval,
    input wire dut_io_pads_qspi_dq_1_o_oval,
    input wire dut_io_pads_qspi_dq_0_o_oval,
    input wire dut_io_pads_qspi_dq_3_o_oe,
    input wire dut_io_pads_qspi_dq_2_o_oe,
    input wire dut_io_pads_qspi_dq_1_o_oe,
    input wire dut_io_pads_qspi_dq_0_o_oe,
    input wire dut_io_pads_qspi_sck_o_oval,
    
    output wire reset_periph,
    output wire slowclk,
    output wire qspi_cs,
    output wire [3:0] qspi_ui_dq_o,
    output wire [3:0] qspi_ui_dq_oe,
    output wire dut_io_pads_qspi_dq_0_i_ival,
    output wire dut_io_pads_qspi_dq_1_i_ival,
    output wire dut_io_pads_qspi_dq_2_i_ival,
    output wire dut_io_pads_qspi_dq_3_i_ival,
    output wire qspi_sck
);

    // Assign constant values
    assign reset_periph = 1'b0;
    assign slowclk = 1'b1;

    // Assign QSPI chip select
    assign qspi_cs = dut_io_pads_qspi_cs_0_o_oval;

    // Assign QSPI data output
    assign qspi_ui_dq_o = {
        dut_io_pads_qspi_dq_3_o_oval,
        dut_io_pads_qspi_dq_2_o_oval,
        dut_io_pads_qspi_dq_1_o_oval,
        dut_io_pads_qspi_dq_0_o_oval
    };

    // Assign QSPI data output enable
    assign qspi_ui_dq_oe = {
        dut_io_pads_qspi_dq_3_o_oe,
        dut_io_pads_qspi_dq_2_o_oe,
        dut_io_pads_qspi_dq_1_o_oe,
        dut_io_pads_qspi_dq_0_o_oe
    };

    // Assign QSPI data input
    assign dut_io_pads_qspi_dq_0_i_ival = qspi_ui_dq_i[0];
    assign dut_io_pads_qspi_dq_1_i_ival = qspi_ui_dq_i[1];
    assign dut_io_pads_qspi_dq_2_i_ival = qspi_ui_dq_i[2];
    assign dut_io_pads_qspi_dq_3_i_ival = qspi_ui_dq_i[3];

    // Assign QSPI clock
    assign qspi_sck = dut_io_pads_qspi_sck_o_oval;

endmodule