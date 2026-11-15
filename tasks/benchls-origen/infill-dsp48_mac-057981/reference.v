(* use_dsp48 = "yes" *)
module origen_057981(
    input  wire        clk,
    input  wire        rst,
    input  wire        ce,
    input  wire [5:0]  a,
    input  wire [7:0]  b,
    input  wire [8:0]  c,
    output wire [12:0] p
);

reg  [5:0] a_reg;
reg  [7:0] b_reg;
reg [13:0] m_reg;
reg [8:0]  c_reg;

always @(posedge clk) begin
    if (rst) begin
        a_reg <= 6'b0;
        b_reg <= 8'b0;
        m_reg <= 14'b0;
        c_reg <= 9'b0;
    end else if (ce) begin
        a_reg <= a;
        b_reg <= b;
        m_reg <= a_reg * b_reg;
        c_reg <= c;
    end
end

assign p = m_reg + c_reg;

endmodule

module img_process_mac_muladd_6ns_8ns_9ns_13_3(
    input  wire        clk,
    input  wire        reset,
    input  wire        ce,
    input  wire [5:0]  din0,
    input  wire [7:0]  din1,
    input  wire [8:0]  din2,
    output wire [12:0] dout
);

img_process_mac_muladd_6ns_8ns_9ns_13_3_DSP48_0 img_process_mac_muladd_6ns_8ns_9ns_13_3_DSP48_0_U(
    .clk(clk),
    .rst(reset),
    .ce(ce),
    .a(din0),
    .b(din1),
    .c(din2),
    .p(dout)
);

endmodule