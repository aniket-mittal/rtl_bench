module origen_053447 #(
    parameter PACKET_BITS = 97,
    parameter NUM_LEAF_BITS = 6,
    parameter NUM_PORT_BITS = 4
) (
    input wire clk,
    input wire reset,
    output reg [PACKET_BITS-1:0] dout_leaf_interface2bft,
    input wire [PACKET_BITS-1:0] din_leaf_bft2interface,
    input wire resend,
    output reg [PACKET_BITS-1:0] stream_out,
    output wire resend_out,
    input wire [PACKET_BITS-1:0] stream_in,
    output reg [PACKET_BITS-1:0] configure_out
);

    localparam INPUT_PORT_MAX_NUM = 8;
    localparam OUTPUT_PORT_MIN_NUM = 9;

    reg vldBit;
    reg [NUM_LEAF_BITS-1:0] leaf;
    reg [NUM_PORT_BITS-1:0] port;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            stream_out <= 0;
            configure_out <= 0;
            vldBit <= 0;
            leaf <= 0;
            port <= 0;
        end else begin
            vldBit <= din_leaf_bft2interface[PACKET_BITS-1];
            leaf <= din_leaf_bft2interface[PACKET_BITS-2 -: NUM_LEAF_BITS];
            port <= din_leaf_bft2interface[PACKET_BITS-2-NUM_LEAF_BITS -: NUM_PORT_BITS];

            if (port >= 2 && port <= INPUT_PORT_MAX_NUM) begin
                stream_out <= din_leaf_bft2interface;
            end else begin
                stream_out <= 0;
            end

            if (port == 0 || port == 1 || port >= OUTPUT_PORT_MIN_NUM) begin
                configure_out <= din_leaf_bft2interface;
            end else begin
                configure_out <= 0;
            end
        end
    end

    assign resend_out = resend;
    always @(*) begin
        dout_leaf_interface2bft = stream_in;
    end

endmodule