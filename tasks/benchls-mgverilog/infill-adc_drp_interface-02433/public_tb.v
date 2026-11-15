// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02433 dut (
    .clk(clk),
    .rst(in_vec[51:51]),
    .rd(in_vec[50:50]),
    .wr(in_vec[49:49]),
    .addr(in_vec[48:42]),
    .data_in(in_vec[41:26]),
    .jtaglocked(in_vec[25:25]),
    .busy(in_vec[24:24]),
    .drdy(in_vec[23:23]),
    .eoc(in_vec[22:22]),
    .eos(in_vec[21:21]),
    .channel(in_vec[20:16]),
    .dout(in_vec[15:0]),
    .data_out(out_vec[41:26]),
    .valid(out_vec[25:25]),
    .dwe(out_vec[24:24]),
    .den(out_vec[23:23]),
    .daddr(out_vec[22:16]),
    .din(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'hac3ca4d504729;
    stim[1] = 52'hdd947ebdc11e0;
    stim[2] = 52'h13150087dcf46;
    stim[3] = 52'h5d0cf4b7bbd73;
    stim[4] = 52'h1907951d3840d;
    stim[5] = 52'h42a76091ba3d5;
    stim[6] = 52'h03e5948812715;
    stim[7] = 52'h7236bf1370c2e;
    stim[8] = 52'h0e50fb7eafb72;
    stim[9] = 52'h0f308d5965be8;
    stim[10] = 52'h68f4ef48bcfd7;
    stim[11] = 52'h06a637d58acc0;
    stim[12] = 52'h6d8c5a0a2292c;
    stim[13] = 52'h7417bef5af929;
    stim[14] = 52'h21037fec11183;
    stim[15] = 52'h4fed70feca936;
    stim[16] = 52'h4cc0e1e8dad9f;
    stim[17] = 52'h04204f9cad3a5;
    stim[18] = 52'h1a4bfa2e03af1;
    stim[19] = 52'h6c2875634d16b;
    stim[20] = 52'h644941fd656d1;
    stim[21] = 52'h6885734481419;
    stim[22] = 52'h68e561291c350;
    stim[23] = 52'h275d0edd044a0;
    stim[24] = 52'hb63cc48a764f0;
    stim[25] = 52'h7eff02517a068;
    stim[26] = 52'h64677a6324980;
    stim[27] = 52'h662aef73c5138;
    stim[28] = 52'h0abe9926345f6;
    stim[29] = 52'h852b633fd80bb;
    stim[30] = 52'h41666f2c4671b;
    stim[31] = 52'h5590376633b16;
    stim[32] = 52'h71c1b78714da4;
    stim[33] = 52'h2a2a223bdfc9d;
    stim[34] = 52'h3fc2a99e56d64;
    stim[35] = 52'h3d58c6aaa459c;
    stim[36] = 52'h7099d93c12b4d;
    stim[37] = 52'h54896f7fa4b57;
    stim[38] = 52'h02a05ce091ea9;
    stim[39] = 52'h0f79442233508;
    stim[40] = 52'h728ef02b0002b;
    stim[41] = 52'h3d4ccb1bdaa92;
    stim[42] = 52'h42215f3a6a164;
    stim[43] = 52'h6543a4f9d2875;
    stim[44] = 52'h57acc732e40a4;
    stim[45] = 52'h3812d8e081ff5;
    stim[46] = 52'h2644a008029b8;
    stim[47] = 52'h6d8949efddebb;
    stim[48] = 52'h58207f159b682;
    stim[49] = 52'h5402dceb49534;
    stim[50] = 52'h511b015dcaa4a;
    stim[51] = 52'h484c687a25598;
    stim[52] = 52'h56309f71b0d28;
    stim[53] = 52'h28eed32e478f5;
    stim[54] = 52'h107bf875b292b;
    stim[55] = 52'h42b96cd0892ef;
    stim[56] = 52'h7a5870ca112d0;
    stim[57] = 52'h5bd04784e396b;
    stim[58] = 52'h10ace1aff7c9a;
    stim[59] = 52'h51e2fb6934ef2;
    stim[60] = 52'h685917c78127e;
    stim[61] = 52'h139d05ea73f64;
    stim[62] = 52'h3ef6acf02689a;
    stim[63] = 52'h56fbfe84d96e1;
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
      expv[0] = 42'h00000000000;
      expv[1] = 42'h00000000000;
      expv[2] = 42'h00000000000;
      expv[3] = 42'h00000000000;
      expv[4] = 42'h00000000000;
      expv[5] = 42'h00000000000;
      expv[6] = 42'h00000000000;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h00000000000;
      expv[10] = 42'h00000000000;
      expv[11] = 42'h00000000000;
      expv[12] = 42'h00000000000;
      expv[13] = 42'h00000000000;
      expv[14] = 42'h00000000000;
      expv[15] = 42'h00001840dff;
      expv[16] = 42'h00002040dff;
      expv[17] = 42'h00000000000;
      expv[18] = 42'h00000000000;
      expv[19] = 42'h00000000000;
      expv[20] = 42'h00000000000;
      expv[21] = 42'h00000000000;
      expv[22] = 42'h00000000000;
      expv[23] = 42'h00000000000;
      expv[24] = 42'h00000000000;
      expv[25] = 42'h00000000000;
      expv[26] = 42'h00000000000;
      expv[27] = 42'h00000000000;
      expv[28] = 42'h00000000000;
      expv[29] = 42'h00000000000;
      expv[30] = 42'h00000000000;
      expv[31] = 42'h00000830000;
      expv[32] = 42'h00000030000;
      expv[33] = 42'h00000030000;
      expv[34] = 42'h3f276030000;
      expv[35] = 42'h00000000000;
      expv[36] = 42'h00001f5631a;
      expv[37] = 42'h0000275631a;
      expv[38] = 42'h00000000000;
      expv[39] = 42'h00000000000;
      expv[40] = 42'h00000000000;
      expv[41] = 42'h00000000000;
      expv[42] = 42'h00000000000;
      expv[43] = 42'h00000000000;
      expv[44] = 42'h00000000000;
      expv[45] = 42'h00000000000;
      expv[46] = 42'h00000000000;
      expv[47] = 42'h00000000000;
      expv[48] = 42'h00000000000;
      expv[49] = 42'h00000000000;
      expv[50] = 42'h00000830000;
      expv[51] = 42'h2a92a030000;
      expv[52] = 42'h00000000000;
      expv[53] = 42'h00000000000;
      expv[54] = 42'h00001a3bb4c;
      expv[55] = 42'h0000023bb4c;
      expv[56] = 42'h0000023bb4c;
      expv[57] = 42'h0000223bb4c;
      expv[58] = 42'h00000830000;
      expv[59] = 42'h1f26a030000;
      expv[60] = 42'h00000000000;
      expv[61] = 42'h00000000000;
      expv[62] = 42'h00000000000;
      expv[63] = 42'h00000000000;
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
