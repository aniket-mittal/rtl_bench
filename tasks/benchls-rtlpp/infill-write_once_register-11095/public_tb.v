// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11095 dut (
    .Clk(clk),
    .Data_in(in_vec[19:4]),
    .ip_resetn(in_vec[3:3]),
    .global_resetn(in_vec[2:2]),
    .write(in_vec[1:1]),
    .write_enable(in_vec[0:0]),
    .Data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hcb3d6;
    stim[1] = 20'h284e1;
    stim[2] = 20'h0783c;
    stim[3] = 20'hc0a4f;
    stim[4] = 20'h5be89;
    stim[5] = 20'h9905a;
    stim[6] = 20'h600da;
    stim[7] = 20'h07bee;
    stim[8] = 20'h9f98f;
    stim[9] = 20'h93f6c;
    stim[10] = 20'h551ba;
    stim[11] = 20'h632bf;
    stim[12] = 20'hb7b6b;
    stim[13] = 20'h3a3df;
    stim[14] = 20'h8a9c8;
    stim[15] = 20'h4fb7b;
    stim[16] = 20'hcd5ef;
    stim[17] = 20'h0685c;
    stim[18] = 20'h3c958;
    stim[19] = 20'ha2c59;
    stim[20] = 20'hd160d;
    stim[21] = 20'hf2a5a;
    stim[22] = 20'ha028f;
    stim[23] = 20'h8b69a;
    stim[24] = 20'hc9179;
    stim[25] = 20'h0a488;
    stim[26] = 20'h73229;
    stim[27] = 20'h2f178;
    stim[28] = 20'ha16b6;
    stim[29] = 20'h7f998;
    stim[30] = 20'h4487b;
    stim[31] = 20'h42bed;
    stim[32] = 20'ha39b9;
    stim[33] = 20'h5750d;
    stim[34] = 20'h46ccd;
    stim[35] = 20'h02ccd;
    stim[36] = 20'hd6d7c;
    stim[37] = 20'h5bbda;
    stim[38] = 20'h0925c;
    stim[39] = 20'hc099a;
    stim[40] = 20'h525e9;
    stim[41] = 20'h4f57d;
    stim[42] = 20'hd4f48;
    stim[43] = 20'ha340f;
    stim[44] = 20'hd339a;
    stim[45] = 20'h23469;
    stim[46] = 20'h7d3cf;
    stim[47] = 20'h179a8;
    stim[48] = 20'ha19ef;
    stim[49] = 20'h4bc6b;
    stim[50] = 20'h3613e;
    stim[51] = 20'hd65a8;
    stim[52] = 20'h87b59;
    stim[53] = 20'h2334d;
    stim[54] = 20'h1ffed;
    stim[55] = 20'h5e389;
    stim[56] = 20'h9b08d;
    stim[57] = 20'hf9bc8;
    stim[58] = 20'h1772e;
    stim[59] = 20'ha61c9;
    stim[60] = 20'h7a42a;
    stim[61] = 20'h91db2;
    stim[62] = 20'hbcb58;
    stim[63] = 20'h0c56f;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'hc0a4;
      expv[5] = 16'hc0a5;
      expv[6] = 16'hc0a5;
      expv[7] = 16'hc0a5;
      expv[8] = 16'hc0a5;
      expv[9] = 16'hc0a5;
      expv[10] = 16'hc0a5;
      expv[11] = 16'hc0a5;
      expv[12] = 16'hc0a5;
      expv[13] = 16'hc0a5;
      expv[14] = 16'hc0a5;
      expv[15] = 16'hc0a5;
      expv[16] = 16'hc0a5;
      expv[17] = 16'hc0a5;
      expv[18] = 16'hc0a5;
      expv[19] = 16'hc0a5;
      expv[20] = 16'hc0a5;
      expv[21] = 16'hc0a5;
      expv[22] = 16'hc0a5;
      expv[23] = 16'hc0a5;
      expv[24] = 16'hc0a5;
      expv[25] = 16'hc0a5;
      expv[26] = 16'hc0a5;
      expv[27] = 16'hc0a5;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h4486;
      expv[32] = 16'h4487;
      expv[33] = 16'h4487;
      expv[34] = 16'h4487;
      expv[35] = 16'h4487;
      expv[36] = 16'h4487;
      expv[37] = 16'h4487;
      expv[38] = 16'h4487;
      expv[39] = 16'h4487;
      expv[40] = 16'h4487;
      expv[41] = 16'h4487;
      expv[42] = 16'h4487;
      expv[43] = 16'h4487;
      expv[44] = 16'h4487;
      expv[45] = 16'h4487;
      expv[46] = 16'h4487;
      expv[47] = 16'h4487;
      expv[48] = 16'h4487;
      expv[49] = 16'h4487;
      expv[50] = 16'h4487;
      expv[51] = 16'h4487;
      expv[52] = 16'h4487;
      expv[53] = 16'h4487;
      expv[54] = 16'h4487;
      expv[55] = 16'h4487;
      expv[56] = 16'h4487;
      expv[57] = 16'h4487;
      expv[58] = 16'h4487;
      expv[59] = 16'h4487;
      expv[60] = 16'h4487;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
