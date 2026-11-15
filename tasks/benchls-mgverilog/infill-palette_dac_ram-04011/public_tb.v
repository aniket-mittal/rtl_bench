// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04011 dut (
    .clk(clk),
    .index(in_vec[32:25]),
    .write(in_vec[24:24]),
    .read_data_cycle(in_vec[23:22]),
    .read_data_register(in_vec[21:14]),
    .write_data_cycle(in_vec[13:12]),
    .write_data_register(in_vec[11:4]),
    .write_data(in_vec[3:0]),
    .red(out_vec[15:12]),
    .green(out_vec[11:8]),
    .blue(out_vec[7:4]),
    .read_data(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h07108edb3;
    stim[1] = 33'h0ea4639b9;
    stim[2] = 33'h0e37207ae;
    stim[3] = 33'h03b84cd0c;
    stim[4] = 33'h1dbfa8515;
    stim[5] = 33'h03114b867;
    stim[6] = 33'h000dc5f97;
    stim[7] = 33'h08f69d882;
    stim[8] = 33'h1df1aee53;
    stim[9] = 33'h0c4750e72;
    stim[10] = 33'h13c9c1ba8;
    stim[11] = 33'h0eb404aa0;
    stim[12] = 33'h16e01e210;
    stim[13] = 33'h022e57d43;
    stim[14] = 33'h0394ae077;
    stim[15] = 33'h13261063e;
    stim[16] = 33'h0e5fb61e7;
    stim[17] = 33'h09cf36152;
    stim[18] = 33'h13beb5f33;
    stim[19] = 33'h0803a72bd;
    stim[20] = 33'h176ce5c0b;
    stim[21] = 33'h0b863c427;
    stim[22] = 33'h199bcdbe8;
    stim[23] = 33'h0c1976d50;
    stim[24] = 33'h0e65e288a;
    stim[25] = 33'h031eb46f8;
    stim[26] = 33'h18314b84d;
    stim[27] = 33'h05ebf1d4b;
    stim[28] = 33'h01c8a91dc;
    stim[29] = 33'h0856f3c9d;
    stim[30] = 33'h0b7e2011b;
    stim[31] = 33'h1a6a6c8ed;
    stim[32] = 33'h0f48e0726;
    stim[33] = 33'h0e16fe558;
    stim[34] = 33'h1bb9ec107;
    stim[35] = 33'h0589e8174;
    stim[36] = 33'h173415b76;
    stim[37] = 33'h119b106f6;
    stim[38] = 33'h143dbc786;
    stim[39] = 33'h16f92ad69;
    stim[40] = 33'h1f71e6bba;
    stim[41] = 33'h1df780e5c;
    stim[42] = 33'h0edc2daa1;
    stim[43] = 33'h0c422a640;
    stim[44] = 33'h1d2dc9aff;
    stim[45] = 33'h0f6af580c;
    stim[46] = 33'h186fb2b85;
    stim[47] = 33'h030bf8556;
    stim[48] = 33'h173019980;
    stim[49] = 33'h101832bb2;
    stim[50] = 33'h12296a059;
    stim[51] = 33'h1c29f1405;
    stim[52] = 33'h0e0acd275;
    stim[53] = 33'h07f24955d;
    stim[54] = 33'h0a1ef0c35;
    stim[55] = 33'h1e5dad745;
    stim[56] = 33'h16902aba9;
    stim[57] = 33'h13fdd04ae;
    stim[58] = 33'h030a9c499;
    stim[59] = 33'h09b2e53c6;
    stim[60] = 33'h18517b725;
    stim[61] = 33'h0fec509b2;
    stim[62] = 33'h176030d71;
    stim[63] = 33'h0937ecb5f;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxx0;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxx0;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxx0;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxx0;
      expv[18] = 16'hxxx0;
      expv[19] = 16'hxxx0;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxx0;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxx0;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxx0;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hexxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxx0;
      expv[40] = 16'hx6xx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxx0;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxx0;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxx0;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'hxxxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxx0;
      expv[56] = 16'hxxx0;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxx0;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxx0;
      expv[63] = 16'hxx2x;
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
