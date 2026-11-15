// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11479 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[63:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h08ed5ddf58;
    stim[1] = 37'h09d891edbf;
    stim[2] = 37'h0b47cdcc3b;
    stim[3] = 37'h0e4a5aa2a6;
    stim[4] = 37'h0eb414d2e8;
    stim[5] = 37'h1b18e70c72;
    stim[6] = 37'h1662a3028b;
    stim[7] = 37'h0b11485e15;
    stim[8] = 37'h0787d41463;
    stim[9] = 37'h0f81871081;
    stim[10] = 37'h0e881133cb;
    stim[11] = 37'h0bd5252edd;
    stim[12] = 37'h126a9deb0a;
    stim[13] = 37'h0297d569a8;
    stim[14] = 37'h078ce915aa;
    stim[15] = 37'h171376333b;
    stim[16] = 37'h0790f44e30;
    stim[17] = 37'h16276c4cb6;
    stim[18] = 37'h1a1c2604aa;
    stim[19] = 37'h173f72850c;
    stim[20] = 37'h17692fc771;
    stim[21] = 37'h17d26b32e5;
    stim[22] = 37'h06cdb3a966;
    stim[23] = 37'h031af418a7;
    stim[24] = 37'h035f037fa0;
    stim[25] = 37'h02abeb23c3;
    stim[26] = 37'h0f43d45c96;
    stim[27] = 37'h06eed4285b;
    stim[28] = 37'h122a0fa3c5;
    stim[29] = 37'h166b555c37;
    stim[30] = 37'h0f47c40e21;
    stim[31] = 37'h0bd4d43e47;
    stim[32] = 37'h039dd9542d;
    stim[33] = 37'h06b8c0d233;
    stim[34] = 37'h1a9faec6f8;
    stim[35] = 37'h07b24279cf;
    stim[36] = 37'h125243cd20;
    stim[37] = 37'h0ea8644b9b;
    stim[38] = 37'h1b2342fa87;
    stim[39] = 37'h123f008ffe;
    stim[40] = 37'h12cfde54b1;
    stim[41] = 37'h059630e671;
    stim[42] = 37'h0f243a5b0d;
    stim[43] = 37'h136e4f4f10;
    stim[44] = 37'h1f04808868;
    stim[45] = 37'h03b1558408;
    stim[46] = 37'h0aeeeb5be6;
    stim[47] = 37'h1a21ce0d31;
    stim[48] = 37'h06dbd0e5d5;
    stim[49] = 37'h0e70b033fc;
    stim[50] = 37'h1ed716c99d;
    stim[51] = 37'h061b580ee2;
    stim[52] = 37'h0308680cc6;
    stim[53] = 37'h1b79d251a7;
    stim[54] = 37'h0719cda001;
    stim[55] = 37'h0e8b868b5e;
    stim[56] = 37'h06535534c0;
    stim[57] = 37'h0641720adf;
    stim[58] = 37'h1e5e8c29a3;
    stim[59] = 37'h17e183a8cc;
    stim[60] = 37'h061b0066f7;
    stim[61] = 37'h16bfa42f64;
    stim[62] = 37'h0609379978;
    stim[63] = 37'h0b72b7168c;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'hcdb3a966cdb3a966;
      expv[24] = 64'hcdb3a966cdb3a966;
      expv[25] = 64'hcdb3a966cdb3a966;
      expv[26] = 64'hcdb3a96600000000;
      expv[27] = 64'hcdb3a966cdb3a966;
      expv[28] = 64'heed4285b00000000;
      expv[29] = 64'heed4285b00000000;
      expv[30] = 64'heed4285b00000000;
      expv[31] = 64'heed4285b00000000;
      expv[32] = 64'heed4285beed4285b;
      expv[33] = 64'heed4285beed4285b;
      expv[34] = 64'hb8c0d23300000000;
      expv[35] = 64'hb8c0d233b8c0d233;
      expv[36] = 64'hb8c0d23300000000;
      expv[37] = 64'hb8c0d23300000000;
      expv[38] = 64'hb8c0d23300000000;
      expv[39] = 64'hb8c0d23300000000;
      expv[40] = 64'hb8c0d23300000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'hdbd0e5d500000000;
      expv[50] = 64'hdbd0e5d500000000;
      expv[51] = 64'hdbd0e5d5dbd0e5d5;
      expv[52] = 64'h1b580ee21b580ee2;
      expv[53] = 64'h1b580ee200000000;
      expv[54] = 64'h1b580ee21b580ee2;
      expv[55] = 64'h1b580ee200000000;
      expv[56] = 64'h1b580ee21b580ee2;
      expv[57] = 64'h535534c0535534c0;
      expv[58] = 64'h41720adf00000000;
      expv[59] = 64'h41720adf00000000;
      expv[60] = 64'h41720adf41720adf;
      expv[61] = 64'h1b0066f700000000;
      expv[62] = 64'h1b0066f71b0066f7;
      expv[63] = 64'h0937997800000000;
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
