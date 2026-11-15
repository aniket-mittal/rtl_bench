// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02528 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h312322f6;
    stim[1] = 31'h01fb60cd;
    stim[2] = 31'h419b0b68;
    stim[3] = 31'h7c01f5a4;
    stim[4] = 31'h5dc5ec16;
    stim[5] = 31'h55add180;
    stim[6] = 31'h506495c9;
    stim[7] = 31'h5cecdfb8;
    stim[8] = 31'h508089f7;
    stim[9] = 31'h759ba884;
    stim[10] = 31'h42f40ac4;
    stim[11] = 31'h5cf2c207;
    stim[12] = 31'h5cea4c81;
    stim[13] = 31'h46552e09;
    stim[14] = 31'h710a45e4;
    stim[15] = 31'h3851dac3;
    stim[16] = 31'h6f70cb72;
    stim[17] = 31'h56dced3a;
    stim[18] = 31'h42dbda3d;
    stim[19] = 31'h64a5ab3f;
    stim[20] = 31'h6bbe3884;
    stim[21] = 31'h4009545e;
    stim[22] = 31'h4f4a04d6;
    stim[23] = 31'h6c3ce936;
    stim[24] = 31'h73aceeb4;
    stim[25] = 31'h4c729eed;
    stim[26] = 31'h7fa0413d;
    stim[27] = 31'h52c779ab;
    stim[28] = 31'h6e2ce39c;
    stim[29] = 31'h478f9782;
    stim[30] = 31'h7f7e852e;
    stim[31] = 31'h6744a1e2;
    stim[32] = 31'h515a9cb6;
    stim[33] = 31'h7794e2c9;
    stim[34] = 31'h648b6838;
    stim[35] = 31'h742c6c97;
    stim[36] = 31'h49388401;
    stim[37] = 31'h6ca71522;
    stim[38] = 31'h522e40e2;
    stim[39] = 31'h46e1c286;
    stim[40] = 31'h47a32e25;
    stim[41] = 31'h7b00b998;
    stim[42] = 31'h6448ae48;
    stim[43] = 31'h56319a9e;
    stim[44] = 31'h4ee37290;
    stim[45] = 31'h68394473;
    stim[46] = 31'h56e88330;
    stim[47] = 31'h51f2aa6f;
    stim[48] = 31'h65c693cc;
    stim[49] = 31'h42de40ec;
    stim[50] = 31'h793d3aaf;
    stim[51] = 31'h5cdc9716;
    stim[52] = 31'h708eddd3;
    stim[53] = 31'h5b032714;
    stim[54] = 31'h6b96c36a;
    stim[55] = 31'h671aeb5b;
    stim[56] = 31'h54742742;
    stim[57] = 31'h62fe85fe;
    stim[58] = 31'h4e2852de;
    stim[59] = 31'h6f18600f;
    stim[60] = 31'h7e5369a6;
    stim[61] = 31'h5848ff09;
    stim[62] = 31'h5297d736;
    stim[63] = 31'h75803fbe;
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
      expv[0] = 36'hxxxxxxxxe;
      expv[1] = 36'hxxxxxxxx3;
      expv[2] = 36'hxxxxxxxx3;
      expv[3] = 36'hxxxxxxxx9;
      expv[4] = 36'h000000196;
      expv[5] = 36'h00000019e;
      expv[6] = 36'h000000199;
      expv[7] = 36'h000000193;
      expv[8] = 36'h00000019e;
      expv[9] = 36'h000000191;
      expv[10] = 36'h000008ee1;
      expv[11] = 36'h000008eeb;
      expv[12] = 36'h000008ee9;
      expv[13] = 36'h000008ee1;
      expv[14] = 36'h000008ee6;
      expv[15] = 36'h0000067ac;
      expv[16] = 36'h0000067ae;
      expv[17] = 36'h000000001;
      expv[18] = 36'h000000001;
      expv[19] = 36'h000000004;
      expv[20] = 36'h000002926;
      expv[21] = 36'h000002dc6;
      expv[22] = 36'h000002dcb;
      expv[23] = 36'h000002dcc;
      expv[24] = 36'h0000048e1;
      expv[25] = 36'h000001516;
      expv[26] = 36'h00000151c;
      expv[27] = 36'h000003531;
      expv[28] = 36'h000003536;
      expv[29] = 36'h0000027a3;
      expv[30] = 36'h0000027a9;
      expv[31] = 36'h000003d61;
      expv[32] = 36'h000001ce6;
      expv[33] = 36'h000001cee;
      expv[34] = 36'h00000357e;
      expv[35] = 36'h000000d11;
      expv[36] = 36'h000001194;
      expv[37] = 36'h000001196;
      expv[38] = 36'h000002f0e;
      expv[39] = 36'h000002f0c;
      expv[40] = 36'h000002f09;
      expv[41] = 36'h000002f06;
      expv[42] = 36'h000005c56;
      expv[43] = 36'h00000375e;
      expv[44] = 36'h000003759;
      expv[45] = 36'h000003751;
      expv[46] = 36'h0000060b3;
      expv[47] = 36'h0000060be;
      expv[48] = 36'h0000060bc;
      expv[49] = 36'h0000051dc;
      expv[50] = 36'h0000051d4;
      expv[51] = 36'h000001a7e;
      expv[52] = 36'h000001a79;
      expv[53] = 36'h000005093;
      expv[54] = 36'h00000509b;
      expv[55] = 36'h000003c2e;
      expv[56] = 36'h0000007b9;
      expv[57] = 36'h0000007b1;
      expv[58] = 36'h000002346;
      expv[59] = 36'h000002343;
      expv[60] = 36'h000003469;
      expv[61] = 36'h000000386;
      expv[62] = 36'h00000038e;
      expv[63] = 36'h000000389;
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
