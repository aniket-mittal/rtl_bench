module origen_140472 #(
    parameter ID = 0,
    parameter NUM_STAGE = 1,
    parameter din0_WIDTH = 32,
    parameter din1_WIDTH = 32,
    parameter din2_WIDTH = 32,
    parameter din3_WIDTH = 32,
    parameter din4_WIDTH = 2,
    parameter dout_WIDTH = 32
) (
    input [din0_WIDTH-1:0] din0,
    input [din1_WIDTH-1:0] din1,
    input [din2_WIDTH-1:0] din2,
    input [din3_WIDTH-1:0] din3,
    input [din4_WIDTH-1:0] din4,
    output reg [dout_WIDTH-1:0] dout
);

    wire signed [dout_WIDTH-1:0] max_value = {1'b0, {(dout_WIDTH-1){1'b1}}};
    wire signed [dout_WIDTH-1:0] selected_input;

    // Select input based on din4[0]
    assign selected_input = (din4[0] == 1'b0) ? 
        ((din0 < din1) ? $signed(din0) : $signed(din1)) :
        ((din2 < din3) ? $signed(din2) : $signed(din3));

    // Perform saturation and enable operations
    [MASKED]

endmodule