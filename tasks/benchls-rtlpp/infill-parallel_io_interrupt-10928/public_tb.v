// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10928 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
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
    stim[0] = 38'h286114aa20;
    stim[1] = 38'h19f8cfffbe;
    stim[2] = 38'h3bfaff3b1b;
    stim[3] = 38'h0f722ebfe4;
    stim[4] = 38'h10e870c64b;
    stim[5] = 38'h3221d68000;
    stim[6] = 38'h16b3103655;
    stim[7] = 38'h3397052137;
    stim[8] = 38'h16c84777d7;
    stim[9] = 38'h1788a4d544;
    stim[10] = 38'h3359fb91c1;
    stim[11] = 38'h0678d20ad2;
    stim[12] = 38'h2f4e965743;
    stim[13] = 38'h1f1b6166fc;
    stim[14] = 38'h2aa8af51f3;
    stim[15] = 38'h064c4d7ddd;
    stim[16] = 38'h1baab31cdb;
    stim[17] = 38'h3234c3b6da;
    stim[18] = 38'h1af1d55533;
    stim[19] = 38'h3e04c4e372;
    stim[20] = 38'h23bd9661a6;
    stim[21] = 38'h37569a8f27;
    stim[22] = 38'h0740a22c92;
    stim[23] = 38'h0f506d03da;
    stim[24] = 38'h3f5f6eddaf;
    stim[25] = 38'h0b56d82c74;
    stim[26] = 38'h12d5148c83;
    stim[27] = 38'h3b96d82b96;
    stim[28] = 38'h2e3a7adb91;
    stim[29] = 38'h267e957215;
    stim[30] = 38'h2238e55fb6;
    stim[31] = 38'h32ff1feff7;
    stim[32] = 38'h0f5ab88364;
    stim[33] = 38'h1b75ce7aa2;
    stim[34] = 38'h1e536d7ab0;
    stim[35] = 38'h12dde6a1c9;
    stim[36] = 38'h37fa3591dc;
    stim[37] = 38'h1a4782d5c8;
    stim[38] = 38'h36ea0c5a8e;
    stim[39] = 38'h2be09896b5;
    stim[40] = 38'h26ec99cd2b;
    stim[41] = 38'h3ec7254875;
    stim[42] = 38'h2bdeb270ef;
    stim[43] = 38'h12deafd661;
    stim[44] = 38'h3280e6da88;
    stim[45] = 38'h07983fc395;
    stim[46] = 38'h1e733bd159;
    stim[47] = 38'h033eb2885b;
    stim[48] = 38'h02687deb44;
    stim[49] = 38'h06295b4070;
    stim[50] = 38'h0a61fe709f;
    stim[51] = 38'h07582ba0fa;
    stim[52] = 38'h00939a1707;
    stim[53] = 38'h2b3b881ac3;
    stim[54] = 38'h2775d094ee;
    stim[55] = 38'h2e62ae47ed;
    stim[56] = 38'h26f7b5d281;
    stim[57] = 38'h3abf35e04c;
    stim[58] = 38'h3fb9aeb708;
    stim[59] = 38'h130fe671f5;
    stim[60] = 38'h120e58cefc;
    stim[61] = 38'h26efe18b19;
    stim[62] = 38'h1abc2a5836;
    stim[63] = 38'h262a7ecaad;
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
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000001;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h100000000;
      expv[16] = 33'h100000001;
      expv[17] = 33'h100000000;
      expv[18] = 33'h100000001;
      expv[19] = 33'h100000000;
      expv[20] = 33'h000000001;
      expv[21] = 33'h100000001;
      expv[22] = 33'h100000001;
      expv[23] = 33'h100000001;
      expv[24] = 33'h100000001;
      expv[25] = 33'h100000001;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000001;
      expv[29] = 33'h100000001;
      expv[30] = 33'h100000001;
      expv[31] = 33'h100000001;
      expv[32] = 33'h100000001;
      expv[33] = 33'h100000001;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000001;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000001;
      expv[41] = 33'h100000001;
      expv[42] = 33'h000000001;
      expv[43] = 33'h000000001;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000001;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000001;
      expv[51] = 33'h100000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000001;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000000;
      expv[60] = 33'h100000000;
      expv[61] = 33'h100000000;
      expv[62] = 33'h100000001;
      expv[63] = 33'h100000000;
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
