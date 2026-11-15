module ym2149_logic (
    input          RESET,
    input          CLK,
    input          CE,
    input          SEL,
    input          MODE,
    input          BC,
    input          BDIR,
    input   [7:0]  DI,
    output  [7:0]  CHANNEL_A,
    output  [7:0]  CHANNEL_B,
    output  [7:0]  CHANNEL_C
);

// Internal registers and logic for the YM2149 functionality
reg [7:0] reg_a, reg_b, reg_c;
always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
        reg_a <= 8'b0;
        reg_b <= 8'b0;
        reg_c <= 8'b0;
    end else if (CE) begin
        if (BDIR) begin
            if (SEL) begin
                if (BC) begin
                    reg_a <= DI;
                end else begin
                    reg_b <= DI;
                end
            end else begin
                reg_c <= DI;
            end
        end
    end
end

assign CHANNEL_A = reg_a;
assign CHANNEL_B = reg_b;
assign CHANNEL_C = reg_c;

endmodule

module rtlpp_09966
(
   input         clock,
   input         reset,
   input         ena,
   
   input         phi_n,
   input         phi_en,
   input  [15:0] addr,
   input   [7:0] din,
   output  [7:0] dout,
   input   [7:0] cpu_di,		
   input         m1_n,
   input         iorq_n,
   input         rd_n,
   input         wr_n,
   output        int_n,
   output        nmi,
   
   input         cursor,
   
   output  [7:0] audio_l,
   output  [7:0] audio_r
);

wire soft_reset = (ena && ~iorq_n && m1_n && addr[15:0] == 16'hF8FF);
wire reset_n = ~(soft_reset | reset) & ena;

wire ctc_ce_n = ~(ena && ~iorq_n && m1_n && addr[15:2] == {12'hF88, 2'b00});

wire ay_sel = (ena && ~iorq_n && ~wr_n && addr[15:9] == {4'hF, 3'b100} && addr[7:4] == 4'h8);

// Internal converted z80ctc module logic
reg [7:0] ctc_dout;
reg       ctc_int_n, ctc_nmi;
reg       ctc_to0, ctc_to2, ctc_to3_trg;

always @(posedge clock or negedge reset_n) begin
   if (!reset_n) begin
      ctc_dout    <= 8'b0;
      ctc_int_n   <= 1'b1;
      ctc_nmi     <= 1'b1;
      ctc_to0     <= 1'b0;
      ctc_to2     <= 1'b0;
      ctc_to3_trg <= 1'b0;
   end else if (!ctc_ce_n) begin
      ctc_dout    <= cpu_di;
      // Logic for generating interrupts, TO signals and NMI
      ctc_int_n   <= phi_n;
      ctc_nmi     <= cursor;
      ctc_to0     <= phi_n;
      ctc_to2     <= phi_n;
      ctc_to3_trg <= ctc_to2;
   end
end

assign dout = ctc_dout;
assign int_n = ctc_int_n;
assign nmi = ctc_nmi;

wire ay_clock = ctc_to0 | phi_n;
reg  ay_ce;
always @(posedge clock) begin
   reg ay_clock_d;

   ay_clock_d <= ay_clock;
   ay_ce <= (~ay_clock_d & ay_clock);
end

wire [9:0] al = {2'b00, chl_a} + {2'b00, chl_b} + {2'b00, chl_c};
assign audio_l = al[9:2] + al[9:4];

wire [7:0] chl_a, chl_b, chl_c;
// Internal converted YM2149 module logic for psg_left
ym2149_logic psg_left (
    .RESET(~reset_n),
    .CLK(clock),
    .CE(ay_ce),
    .SEL(1'b1),
    .MODE(1'b0),
    .BC(addr[8]),
    .BDIR(ay_sel & addr[2]),
    .DI(din),
    .CHANNEL_A(chl_a),
    .CHANNEL_B(chl_b),
    .CHANNEL_C(chl_c)
);

wire [9:0] ar = {2'b00, chr_a} + {2'b00, chr_b} + {2'b00, chr_c};
assign audio_r = ar[9:2] + ar[9:4];

wire [7:0] chr_a, chr_b, chr_c;
// Internal converted YM2149 module logic for psg_right
ym2149_logic psg_right (
    .RESET(~reset_n),
    .CLK(clock),
    .CE(ay_ce),
    .SEL(1'b1),
    .MODE(1'b0),
    .BC(addr[8]),
    .BDIR(ay_sel & addr[3]),
    .DI(din),
    .CHANNEL_A(chr_a),
    .CHANNEL_B(chr_b),
    .CHANNEL_C(chr_c)
);

endmodule