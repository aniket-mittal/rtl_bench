// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01352 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
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
    stim[0] = 37'h0db01761c7;
    stim[1] = 37'h1109c9ce71;
    stim[2] = 37'h0b10702791;
    stim[3] = 37'h17b534db34;
    stim[4] = 37'h06f0b9fb70;
    stim[5] = 37'h0ec5bd61b9;
    stim[6] = 37'h1bbf556cff;
    stim[7] = 37'h1ff13ffb38;
    stim[8] = 37'h0f86ef3627;
    stim[9] = 37'h1bd0a5339a;
    stim[10] = 37'h16e47141ba;
    stim[11] = 37'h0e65fd5e87;
    stim[12] = 37'h13807701f7;
    stim[13] = 37'h066c425efd;
    stim[14] = 37'h0b3af6a24c;
    stim[15] = 37'h16c0db95cd;
    stim[16] = 37'h122d48b7c7;
    stim[17] = 37'h0ece1913cd;
    stim[18] = 37'h0f29393c71;
    stim[19] = 37'h0e41a26363;
    stim[20] = 37'h078dd40048;
    stim[21] = 37'h0e23dc0a5c;
    stim[22] = 37'h17d203fbaa;
    stim[23] = 37'h1f3cad3d8a;
    stim[24] = 37'h130e023876;
    stim[25] = 37'h0fcf87a6ab;
    stim[26] = 37'h1755929154;
    stim[27] = 37'h0af388a600;
    stim[28] = 37'h1f09ccf2db;
    stim[29] = 37'h036c64265a;
    stim[30] = 37'h1e5458f464;
    stim[31] = 37'h07ad747345;
    stim[32] = 37'h0734a507cc;
    stim[33] = 37'h0fbdd83f04;
    stim[34] = 37'h1a18e01760;
    stim[35] = 37'h1e8a12c8f2;
    stim[36] = 37'h0a47698a12;
    stim[37] = 37'h1fef6f3c3d;
    stim[38] = 37'h1670903ee8;
    stim[39] = 37'h0fd122273b;
    stim[40] = 37'h170cff4582;
    stim[41] = 37'h1770ecce68;
    stim[42] = 37'h1fdc000a3f;
    stim[43] = 37'h0b8eb535bb;
    stim[44] = 37'h1be205b14a;
    stim[45] = 37'h1b8bc13012;
    stim[46] = 37'h07093d9677;
    stim[47] = 37'h0e635ac493;
    stim[48] = 37'h07443ba2f9;
    stim[49] = 37'h1363b0b756;
    stim[50] = 37'h1b01d38a76;
    stim[51] = 37'h1ab4f76920;
    stim[52] = 37'h068e4c1803;
    stim[53] = 37'h0669ccfa7e;
    stim[54] = 37'h135a668a42;
    stim[55] = 37'h164cc07e99;
    stim[56] = 37'h0232b44f4d;
    stim[57] = 37'h0fb3a1d6a9;
    stim[58] = 37'h16df2af7f9;
    stim[59] = 37'h1ebe870b4a;
    stim[60] = 37'h0695f479de;
    stim[61] = 37'h1bc225872c;
    stim[62] = 37'h12364c556d;
    stim[63] = 37'h0323ae2295;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h100000001;
      expv[15] = 33'h100000001;
      expv[16] = 33'h100000001;
      expv[17] = 33'h100000001;
      expv[18] = 33'h100000001;
      expv[19] = 33'h100000001;
      expv[20] = 33'h100000001;
      expv[21] = 33'h100000001;
      expv[22] = 33'h100000001;
      expv[23] = 33'h100000001;
      expv[24] = 33'h100000001;
      expv[25] = 33'h100000001;
      expv[26] = 33'h100000001;
      expv[27] = 33'h100000001;
      expv[28] = 33'h100000001;
      expv[29] = 33'h100000001;
      expv[30] = 33'h100000001;
      expv[31] = 33'h100000001;
      expv[32] = 33'h100000001;
      expv[33] = 33'h100000001;
      expv[34] = 33'h100000001;
      expv[35] = 33'h100000001;
      expv[36] = 33'h100000001;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000001;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000001;
      expv[41] = 33'h100000001;
      expv[42] = 33'h100000001;
      expv[43] = 33'h100000001;
      expv[44] = 33'h100000001;
      expv[45] = 33'h100000001;
      expv[46] = 33'h100000001;
      expv[47] = 33'h100000001;
      expv[48] = 33'h100000001;
      expv[49] = 33'h100000001;
      expv[50] = 33'h100000001;
      expv[51] = 33'h100000001;
      expv[52] = 33'h100000001;
      expv[53] = 33'h100000001;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
