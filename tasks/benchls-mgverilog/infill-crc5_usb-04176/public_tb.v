// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04176 dut (
    .clk(clk),
    .rstCRC(in_vec[11:11]),
    .CRCEn(in_vec[10:10]),
    .CRC5_8BitIn(in_vec[9:9]),
    .dataIn(in_vec[8:1]),
    .rst(in_vec[0:0]),
    .CRCResult(out_vec[5:1]),
    .ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hcdb;
    stim[1] = 12'hf19;
    stim[2] = 12'hf10;
    stim[3] = 12'h7e8;
    stim[4] = 12'h154;
    stim[5] = 12'h15c;
    stim[6] = 12'h00e;
    stim[7] = 12'hafc;
    stim[8] = 12'h87e;
    stim[9] = 12'h5bc;
    stim[10] = 12'h9d8;
    stim[11] = 12'hc63;
    stim[12] = 12'hb68;
    stim[13] = 12'he6a;
    stim[14] = 12'h005;
    stim[15] = 12'hfe4;
    stim[16] = 12'hd18;
    stim[17] = 12'hcb4;
    stim[18] = 12'h769;
    stim[19] = 12'h74a;
    stim[20] = 12'h748;
    stim[21] = 12'h0ec;
    stim[22] = 12'h685;
    stim[23] = 12'h4a8;
    stim[24] = 12'hbd4;
    stim[25] = 12'h4e4;
    stim[26] = 12'h352;
    stim[27] = 12'hbda;
    stim[28] = 12'heee;
    stim[29] = 12'h29c;
    stim[30] = 12'h49c;
    stim[31] = 12'h266;
    stim[32] = 12'h6e6;
    stim[33] = 12'hd64;
    stim[34] = 12'hc54;
    stim[35] = 12'hd84;
    stim[36] = 12'he84;
    stim[37] = 12'h698;
    stim[38] = 12'hc3e;
    stim[39] = 12'h948;
    stim[40] = 12'h160;
    stim[41] = 12'h648;
    stim[42] = 12'h8c6;
    stim[43] = 12'hc58;
    stim[44] = 12'h406;
    stim[45] = 12'ha2c;
    stim[46] = 12'hfe0;
    stim[47] = 12'h154;
    stim[48] = 12'hcfc;
    stim[49] = 12'h33c;
    stim[50] = 12'h146;
    stim[51] = 12'hc3c;
    stim[52] = 12'h450;
    stim[53] = 12'h9b8;
    stim[54] = 12'h34a;
    stim[55] = 12'h46d;
    stim[56] = 12'h95c;
    stim[57] = 12'he50;
    stim[58] = 12'hbd8;
    stim[59] = 12'he26;
    stim[60] = 12'h0d4;
    stim[61] = 12'hb14;
    stim[62] = 12'hd66;
    stim[63] = 12'h024;
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
      expv[0] = 6'hxx;
      expv[1] = 6'h3f;
      expv[2] = 6'h3f;
      expv[3] = 6'h3f;
      expv[4] = 6'h3e;
      expv[5] = 6'h36;
      expv[6] = 6'h32;
      expv[7] = 6'h18;
      expv[8] = 6'h3f;
      expv[9] = 6'h3f;
      expv[10] = 6'h3e;
      expv[11] = 6'h3f;
      expv[12] = 6'h3f;
      expv[13] = 6'h3f;
      expv[14] = 6'h3f;
      expv[15] = 6'h3f;
      expv[16] = 6'h3f;
      expv[17] = 6'h3f;
      expv[18] = 6'h3f;
      expv[19] = 6'h3f;
      expv[20] = 6'h3e;
      expv[21] = 6'h1e;
      expv[22] = 6'h26;
      expv[23] = 6'h3f;
      expv[24] = 6'h3e;
      expv[25] = 6'h3f;
      expv[26] = 6'h3e;
      expv[27] = 6'h36;
      expv[28] = 6'h3f;
      expv[29] = 6'h3f;
      expv[30] = 6'h3f;
      expv[31] = 6'h3e;
      expv[32] = 6'h36;
      expv[33] = 6'h1a;
      expv[34] = 6'h3f;
      expv[35] = 6'h3f;
      expv[36] = 6'h3f;
      expv[37] = 6'h3f;
      expv[38] = 6'h3e;
      expv[39] = 6'h3f;
      expv[40] = 6'h3f;
      expv[41] = 6'h3f;
      expv[42] = 6'h3e;
      expv[43] = 6'h3f;
      expv[44] = 6'h3f;
      expv[45] = 6'h3e;
      expv[46] = 6'h3f;
      expv[47] = 6'h3f;
      expv[48] = 6'h3f;
      expv[49] = 6'h3f;
      expv[50] = 6'h3f;
      expv[51] = 6'h3f;
      expv[52] = 6'h3f;
      expv[53] = 6'h3e;
      expv[54] = 6'h3f;
      expv[55] = 6'h3f;
      expv[56] = 6'h3f;
      expv[57] = 6'h3f;
      expv[58] = 6'h3f;
      expv[59] = 6'h3f;
      expv[60] = 6'h3f;
      expv[61] = 6'h3f;
      expv[62] = 6'h3f;
      expv[63] = 6'h3f;
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
