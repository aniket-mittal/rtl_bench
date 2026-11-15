module csi_fuzzer #
	(
        parameter integer CSI_FUZZER_WIDTH = 6,
        parameter integer IQ_DATA_WIDTH = 16
	)
	(
        input wire rstn,
        input wire clk,
        
        // input data
        input wire [(2*IQ_DATA_WIDTH-1):0] iq,
        input wire iq_valid,

        // FIR coef of the fuzzer
        input wire signed [(CSI_FUZZER_WIDTH-1):0] bb_gain1,
        input wire              bb_gain1_rot90_flag,
        input wire signed [(CSI_FUZZER_WIDTH-1):0] bb_gain2,
        input wire              bb_gain2_rot90_flag,

        // output data
        output reg [(2*IQ_DATA_WIDTH-1):0] iq_out
	);
    
    wire signed [(IQ_DATA_WIDTH-1) : 0] i0;
    wire signed [(IQ_DATA_WIDTH-1) : 0] q0;
    reg  signed [(IQ_DATA_WIDTH-1) : 0] i1;
    reg  signed [(IQ_DATA_WIDTH-1) : 0] q1;
    reg  signed [(IQ_DATA_WIDTH-1) : 0] i2;
    reg  signed [(IQ_DATA_WIDTH-1) : 0] q2;

    reg signed [(CSI_FUZZER_WIDTH+IQ_DATA_WIDTH-1) : 0] tap1_result_i;
    reg signed [(CSI_FUZZER_WIDTH+IQ_DATA_WIDTH-1) : 0] tap1_result_q;
    reg signed [(CSI_FUZZER_WIDTH+IQ_DATA_WIDTH-1) : 0] tap2_result_i;
    reg signed [(CSI_FUZZER_WIDTH+IQ_DATA_WIDTH-1) : 0] tap2_result_q;

    assign i0 = iq[  (IQ_DATA_WIDTH-1) : 0];
    assign q0 = iq[(2*IQ_DATA_WIDTH-1) : IQ_DATA_WIDTH];

    // delay samples for different taps
    [MASKED]

	endmodule