// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_195594 dut (
    .Clk(clk),
    .CP0Idx(in_vec[50:46]),
    .DIn(in_vec[45:14]),
    .We(in_vec[13:13]),
    .ExcEnter(in_vec[12:12]),
    .ExcCode(in_vec[11:7]),
    .HWInt(in_vec[6:1]),
    .Reset(in_vec[0:0]),
    .DOut(out_vec[64:33]),
    .Inter(out_vec[32:32]),
    .EPCout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h3277ca9549771;
    stim[1] = 51'h11a4e07a655dd;
    stim[2] = 51'h38f8812bd9eb0;
    stim[3] = 51'h1eda078806436;
    stim[4] = 51'h7d474181616f8;
    stim[5] = 51'h425bd64aa4918;
    stim[6] = 51'h4c5a58a226b7a;
    stim[7] = 51'h3c72b1b1d6134;
    stim[8] = 51'h0111c2472c862;
    stim[9] = 51'h697636ea7f37c;
    stim[10] = 51'h70371826a40c4;
    stim[11] = 51'h5ec7eb6bd8796;
    stim[12] = 51'h512c8d9cdb2fa;
    stim[13] = 51'h773016e9e1cb2;
    stim[14] = 51'h1a399bc2e9092;
    stim[15] = 51'h138c016e72f92;
    stim[16] = 51'h1da3bd41a06b2;
    stim[17] = 51'h3a6020b8e4162;
    stim[18] = 51'h1d727afce0fc0;
    stim[19] = 51'h4d19df299fa02;
    stim[20] = 51'h3b4c35203f812;
    stim[21] = 51'h0bb501342e193;
    stim[22] = 51'h19483b2e44d82;
    stim[23] = 51'h342ffb738e256;
    stim[24] = 51'h1247222a7bbce;
    stim[25] = 51'h1e2150bdab104;
    stim[26] = 51'h72f37c7dd4c74;
    stim[27] = 51'h71059418a2b62;
    stim[28] = 51'h04b7a008f3ee8;
    stim[29] = 51'h64dd61ce61d24;
    stim[30] = 51'h2e12718f7d6e2;
    stim[31] = 51'h402d7ba6be600;
    stim[32] = 51'h324df7ca3aa66;
    stim[33] = 51'h30ec6a8beb3c0;
    stim[34] = 51'h5bb525533e06e;
    stim[35] = 51'h3d385d72a4968;
    stim[36] = 51'h198122b878bb6;
    stim[37] = 51'h58b3b3cf95162;
    stim[38] = 51'h47e42efc2b968;
    stim[39] = 51'h17996cd2e6dca;
    stim[40] = 51'h1a9e7eecade9c;
    stim[41] = 51'h7c0670378dcd0;
    stim[42] = 51'h237ab5c195ba6;
    stim[43] = 51'h1d266b809756c;
    stim[44] = 51'h1e1ac625e2ee2;
    stim[45] = 51'h552f062fa71ee;
    stim[46] = 51'h0f7f58f609cb8;
    stim[47] = 51'h22536fb3d65d4;
    stim[48] = 51'h77f25f42f1b9c;
    stim[49] = 51'h71116956462b8;
    stim[50] = 51'h7228ced4e3fc4;
    stim[51] = 51'h296dff9e95e1e;
    stim[52] = 51'h0515eb2d419ba;
    stim[53] = 51'h1a8c212316e1c;
    stim[54] = 51'h631ce82be9712;
    stim[55] = 51'h31160e78b7e16;
    stim[56] = 51'h7184ccc2bbb54;
    stim[57] = 51'h5f501fe84057c;
    stim[58] = 51'h5b118f3bb559e;
    stim[59] = 51'h701fe98ddf5a0;
    stim[60] = 51'h304b11ab045ae;
    stim[61] = 51'h73c14e9d7c7b6;
    stim[62] = 51'h3b264a1abf142;
    stim[63] = 51'h3b13dad278f4a;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000000;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
