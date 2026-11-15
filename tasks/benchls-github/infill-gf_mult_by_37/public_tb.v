// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_37 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hdd;
    stim[1] = 8'hc0;
    stim[2] = 8'hb1;
    stim[3] = 8'hb9;
    stim[4] = 8'h68;
    stim[5] = 8'h17;
    stim[6] = 8'hb3;
    stim[7] = 8'h4c;
    stim[8] = 8'hcd;
    stim[9] = 8'h76;
    stim[10] = 8'h6e;
    stim[11] = 8'hd7;
    stim[12] = 8'heb;
    stim[13] = 8'hcc;
    stim[14] = 8'hc4;
    stim[15] = 8'h79;
    stim[16] = 8'hd1;
    stim[17] = 8'h00;
    stim[18] = 8'h8c;
    stim[19] = 8'h7c;
    stim[20] = 8'he4;
    stim[21] = 8'h1a;
    stim[22] = 8'h23;
    stim[23] = 8'hd4;
    stim[24] = 8'hb4;
    stim[25] = 8'hde;
    stim[26] = 8'hd4;
    stim[27] = 8'hd8;
    stim[28] = 8'h8c;
    stim[29] = 8'hbb;
    stim[30] = 8'h50;
    stim[31] = 8'h9e;
    stim[32] = 8'ha4;
    stim[33] = 8'ha8;
    stim[34] = 8'h7f;
    stim[35] = 8'hdd;
    stim[36] = 8'h8b;
    stim[37] = 8'h51;
    stim[38] = 8'hba;
    stim[39] = 8'hba;
    stim[40] = 8'h38;
    stim[41] = 8'he9;
    stim[42] = 8'h97;
    stim[43] = 8'heb;
    stim[44] = 8'ha9;
    stim[45] = 8'h74;
    stim[46] = 8'h33;
    stim[47] = 8'h9f;
    stim[48] = 8'he8;
    stim[49] = 8'hd8;
    stim[50] = 8'h0a;
    stim[51] = 8'hc7;
    stim[52] = 8'hcc;
    stim[53] = 8'h78;
    stim[54] = 8'h2c;
    stim[55] = 8'he2;
    stim[56] = 8'hd9;
    stim[57] = 8'h5f;
    stim[58] = 8'h51;
    stim[59] = 8'h0b;
    stim[60] = 8'hc6;
    stim[61] = 8'h71;
    stim[62] = 8'h47;
    stim[63] = 8'h6b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'hda;
      expv[1] = 8'hc3;
      expv[2] = 8'h4c;
      expv[3] = 8'he9;
      expv[4] = 8'h4a;
      expv[5] = 8'hd2;
      expv[6] = 8'h22;
      expv[7] = 8'h38;
      expv[8] = 8'h8d;
      expv[9] = 8'h0a;
      expv[10] = 8'hf8;
      expv[11] = 8'h11;
      expv[12] = 8'h91;
      expv[13] = 8'hba;
      expv[14] = 8'h1f;
      expv[15] = 8'h2a;
      expv[16] = 8'ha3;
      expv[17] = 8'h00;
      expv[18] = 8'hfb;
      expv[19] = 8'hc1;
      expv[20] = 8'hb1;
      expv[21] = 8'h9c;
      expv[22] = 8'hf7;
      expv[23] = 8'h48;
      expv[24] = 8'ha7;
      expv[25] = 8'h83;
      expv[26] = 8'h48;
      expv[27] = 8'h31;
      expv[28] = 8'hfb;
      expv[29] = 8'h87;
      expv[30] = 8'h16;
      expv[31] = 8'hc2;
      expv[32] = 8'hf0;
      expv[33] = 8'h89;
      expv[34] = 8'h98;
      expv[35] = 8'hda;
      expv[36] = 8'h7e;
      expv[37] = 8'h21;
      expv[38] = 8'hb0;
      expv[39] = 8'hb0;
      expv[40] = 8'h5c;
      expv[41] = 8'hff;
      expv[42] = 8'h50;
      expv[43] = 8'h91;
      expv[44] = 8'hbe;
      expv[45] = 8'h64;
      expv[46] = 8'ha0;
      expv[47] = 8'hf5;
      expv[48] = 8'hc8;
      expv[49] = 8'h31;
      expv[50] = 8'hcb;
      expv[51] = 8'h46;
      expv[52] = 8'hba;
      expv[53] = 8'h1d;
      expv[54] = 8'hd7;
      expv[55] = 8'h03;
      expv[56] = 8'h06;
      expv[57] = 8'h36;
      expv[58] = 8'h21;
      expv[59] = 8'hfc;
      expv[60] = 8'h71;
      expv[61] = 8'h8f;
      expv[62] = 8'hc4;
      expv[63] = 8'h13;
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
