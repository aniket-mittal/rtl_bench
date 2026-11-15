// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_010351 dut (
    .clk(clk),
    .wr_data(in_vec[24:17]),
    .rd_addr(in_vec[16:11]),
    .wr_addr(in_vec[10:5]),
    .wr_en(in_vec[4:1]),
    .rd_en(in_vec[0:0]),
    .rd_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1febc27;
    stim[1] = 25'h0401a70;
    stim[2] = 25'h03f7ce2;
    stim[3] = 25'h1cecba3;
    stim[4] = 25'h03a4d34;
    stim[5] = 25'h0274a49;
    stim[6] = 25'h1f14c57;
    stim[7] = 25'h1765dfc;
    stim[8] = 25'h1797194;
    stim[9] = 25'h0ca0c97;
    stim[10] = 25'h13ac649;
    stim[11] = 25'h1ab85c4;
    stim[12] = 25'h13fd2e3;
    stim[13] = 25'h155a86d;
    stim[14] = 25'h02a905d;
    stim[15] = 25'h0e8c153;
    stim[16] = 25'h00c5b5c;
    stim[17] = 25'h176799c;
    stim[18] = 25'h0c6f52b;
    stim[19] = 25'h18135cb;
    stim[20] = 25'h15d5835;
    stim[21] = 25'h0b09700;
    stim[22] = 25'h074993b;
    stim[23] = 25'h149bd69;
    stim[24] = 25'h0257028;
    stim[25] = 25'h14e084a;
    stim[26] = 25'h0e87546;
    stim[27] = 25'h11a32e9;
    stim[28] = 25'h190e54b;
    stim[29] = 25'h05a8d2b;
    stim[30] = 25'h0c33b50;
    stim[31] = 25'h0ae84f7;
    stim[32] = 25'h1b72dfd;
    stim[33] = 25'h0e761e9;
    stim[34] = 25'h0ee6cac;
    stim[35] = 25'h1f906fc;
    stim[36] = 25'h0644fc1;
    stim[37] = 25'h190b290;
    stim[38] = 25'h12b42fb;
    stim[39] = 25'h0479cc1;
    stim[40] = 25'h0a153a6;
    stim[41] = 25'h04d731f;
    stim[42] = 25'h1a9f607;
    stim[43] = 25'h186c19a;
    stim[44] = 25'h0a9bce5;
    stim[45] = 25'h03b6e74;
    stim[46] = 25'h1ab97eb;
    stim[47] = 25'h06c3b1f;
    stim[48] = 25'h1d40f38;
    stim[49] = 25'h1b553fc;
    stim[50] = 25'h14a4406;
    stim[51] = 25'h11d03d3;
    stim[52] = 25'h04e2ebc;
    stim[53] = 25'h0ee1274;
    stim[54] = 25'h1ae5efc;
    stim[55] = 25'h1fd3e0f;
    stim[56] = 25'h1770356;
    stim[57] = 25'h1f7c395;
    stim[58] = 25'h0aadc6d;
    stim[59] = 25'h05d2e43;
    stim[60] = 25'h06dbe0c;
    stim[61] = 25'h13a0649;
    stim[62] = 25'h092c048;
    stim[63] = 25'h1c9a39f;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'h1dxx1dxx;
      expv[7] = 32'h1dxx1dxx;
      expv[8] = 32'h1dxx1dxx;
      expv[9] = 32'h1dxx1dxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxx13xxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'h20xxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'h3a3axx3a;
      expv[38] = 32'h3a3axx3a;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxc0d5c0;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hfcfcfcxx;
      expv[46] = 32'hfcfcfcxx;
      expv[47] = 32'hxx9dxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxa5a5;
      expv[53] = 32'hxxxxa5a5;
      expv[54] = 32'hxxxxa5a5;
      expv[55] = 32'hxxxxa5a5;
      expv[56] = 32'h57xx5457;
      expv[57] = 32'h57xx5457;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxx7777xx;
      expv[61] = 32'hxx7777xx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
