// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  salt_to_bin dut (
    .in(in_vec[15:0]),
    .out(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hee0d;
    stim[1] = 16'h57f9;
    stim[2] = 16'h1232;
    stim[3] = 16'hdc6d;
    stim[4] = 16'ha5b5;
    stim[5] = 16'hbf93;
    stim[6] = 16'h2d4b;
    stim[7] = 16'ha701;
    stim[8] = 16'h41ec;
    stim[9] = 16'hd283;
    stim[10] = 16'h49ca;
    stim[11] = 16'h3dd1;
    stim[12] = 16'h3209;
    stim[13] = 16'hed08;
    stim[14] = 16'h1b9e;
    stim[15] = 16'hf570;
    stim[16] = 16'hf7f7;
    stim[17] = 16'hffe7;
    stim[18] = 16'h5d2e;
    stim[19] = 16'h0ea8;
    stim[20] = 16'hcaf3;
    stim[21] = 16'h57fe;
    stim[22] = 16'h835c;
    stim[23] = 16'h2211;
    stim[24] = 16'h7616;
    stim[25] = 16'h70c4;
    stim[26] = 16'h8ccd;
    stim[27] = 16'hbcb2;
    stim[28] = 16'h61af;
    stim[29] = 16'hbcce;
    stim[30] = 16'hd5d1;
    stim[31] = 16'h758f;
    stim[32] = 16'h7205;
    stim[33] = 16'he84d;
    stim[34] = 16'h3ea4;
    stim[35] = 16'he4e2;
    stim[36] = 16'h1ab7;
    stim[37] = 16'h1da2;
    stim[38] = 16'hd005;
    stim[39] = 16'h80dc;
    stim[40] = 16'hba82;
    stim[41] = 16'h5239;
    stim[42] = 16'h35fc;
    stim[43] = 16'h8123;
    stim[44] = 16'h2be2;
    stim[45] = 16'h96fb;
    stim[46] = 16'h45cc;
    stim[47] = 16'h703c;
    stim[48] = 16'h0700;
    stim[49] = 16'h1a3f;
    stim[50] = 16'hffbd;
    stim[51] = 16'h8068;
    stim[52] = 16'h6bb3;
    stim[53] = 16'h52ec;
    stim[54] = 16'h45d3;
    stim[55] = 16'h74e7;
    stim[56] = 16'h0a8c;
    stim[57] = 16'h1956;
    stim[58] = 16'hd8d7;
    stim[59] = 16'h2b17;
    stim[60] = 16'h3fa7;
    stim[61] = 16'h0b52;
    stim[62] = 16'hb548;
    stim[63] = 16'h6f02;
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
      expv[0] = 12'h7f3;
      expv[1] = 12'hfa2;
      expv[2] = 12'h124;
      expv[3] = 12'hca1;
      expv[4] = 12'heaa;
      expv[5] = 12'h604;
      expv[6] = 12'h5bf;
      expv[7] = 12'h4ec;
      expv[8] = 12'hc4c;
      expv[9] = 12'h217;
      expv[10] = 12'h3d4;
      expv[11] = 12'h58f;
      expv[12] = 12'h6c4;
      expv[13] = 12'h6b2;
      expv[14] = 12'h8ed;
      expv[15] = 12'hd7a;
      expv[16] = 12'hf3c;
      expv[17] = 12'hb04;
      expv[18] = 12'h028;
      expv[19] = 12'hb60;
      expv[20] = 12'he0f;
      expv[21] = 12'h0e2;
      expv[22] = 12'h9c8;
      expv[23] = 12'h8f4;
      expv[24] = 12'ha3b;
      expv[25] = 12'h275;
      expv[26] = 12'h491;
      expv[27] = 12'hdc1;
      expv[28] = 12'hd26;
      expv[29] = 12'h4c1;
      expv[30] = 12'h59a;
      expv[31] = 12'h53a;
      expv[32] = 12'h5f7;
      expv[33] = 12'h62d;
      expv[34] = 12'ha50;
      expv[35] = 12'h9e9;
      expv[36] = 12'hf2c;
      expv[37] = 12'h9ef;
      expv[38] = 12'h5d5;
      expv[39] = 12'h845;
      expv[40] = 12'h1ff;
      expv[41] = 12'h2dd;
      expv[42] = 12'h047;
      expv[43] = 12'hd46;
      expv[44] = 12'h9fd;
      expv[45] = 12'h01b;
      expv[46] = 12'h450;
      expv[47] = 12'h3b5;
      expv[48] = 12'h499;
      expv[49] = 12'h46c;
      expv[50] = 12'h084;
      expv[51] = 12'hb45;
      expv[52] = 12'he30;
      expv[53] = 12'hc5d;
      expv[54] = 12'h610;
      expv[55] = 12'hb39;
      expv[56] = 12'h45c;
      expv[57] = 12'h86b;
      expv[58] = 12'h71d;
      expv[59] = 12'ha7d;
      expv[60] = 12'hb11;
      expv[61] = 12'h75d;
      expv[62] = 12'h4fa;
      expv[63] = 12'h534;
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
