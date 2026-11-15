// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08140 dut (
    .clk(clk),
    .read_addr0(in_vec[56:49]),
    .read_addr1(in_vec[48:41]),
    .wr(in_vec[40:40]),
    .write_addr(in_vec[39:32]),
    .write_data(in_vec[31:0]),
    .read_data0(out_vec[63:32]),
    .read_data1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h1f979569c8486e4;
    stim[1] = 57'h006faab1468b158;
    stim[2] = 57'h048b516b194dd01;
    stim[3] = 57'h170f9c7c627c280;
    stim[4] = 57'h09752320f88075a;
    stim[5] = 57'h1878ce26b77b33e;
    stim[6] = 57'h094c776e21e31be;
    stim[7] = 57'h087a67f69968598;
    stim[8] = 57'h0b9c06c1b20337a;
    stim[9] = 57'h08b0884563c15b5;
    stim[10] = 57'h17200696624c282;
    stim[11] = 57'h0712ab8d7e0baeb;
    stim[12] = 57'h0e20e0c94f8e03f;
    stim[13] = 57'h0461985a9c30747;
    stim[14] = 57'h06d3a81a1f8d709;
    stim[15] = 57'h1b8c74c381b392e;
    stim[16] = 57'h0e85f2550286343;
    stim[17] = 57'h1db220c417a8955;
    stim[18] = 57'h0a086c21e742ebc;
    stim[19] = 57'h1fa2762a695e010;
    stim[20] = 57'h1ca463ff8f6c0d4;
    stim[21] = 57'h0c7b470468f1e56;
    stim[22] = 57'h01de20ab40caf8d;
    stim[23] = 57'h10a1a3275519349;
    stim[24] = 57'h0777f026be568a0;
    stim[25] = 57'h1676d3e0a8e477e;
    stim[26] = 57'h1e3772c2c795294;
    stim[27] = 57'h10ffd6ee0f801c7;
    stim[28] = 57'h0ac3e7657c6b543;
    stim[29] = 57'h182a3433852d0a9;
    stim[30] = 57'h19e9541e6e81e00;
    stim[31] = 57'h118ca44de4b43e6;
    stim[32] = 57'h08959e443018e2b;
    stim[33] = 57'h07dbea7311ecaac;
    stim[34] = 57'h062f8a97baded0f;
    stim[35] = 57'h0dd857dbf3f2715;
    stim[36] = 57'h09521fcd0737b68;
    stim[37] = 57'h15509466702564e;
    stim[38] = 57'h14c6f4d47fc6b3d;
    stim[39] = 57'h1070239bf2aebba;
    stim[40] = 57'h05cf4642e50377b;
    stim[41] = 57'h0490fe55fdb0461;
    stim[42] = 57'h1822838081d84f1;
    stim[43] = 57'h0c805139c6484e0;
    stim[44] = 57'h143eb37c66ba587;
    stim[45] = 57'h1f4a4c5500d0ed7;
    stim[46] = 57'h17d6fbf3148326a;
    stim[47] = 57'h1e76896fe768fbb;
    stim[48] = 57'h03d3bc36c859fbc;
    stim[49] = 57'h020306e3e28a344;
    stim[50] = 57'h0cdf98e5ab2ff44;
    stim[51] = 57'h15af817738d261a;
    stim[52] = 57'h0a737a4d11a18a4;
    stim[53] = 57'h1c5129e427c22dd;
    stim[54] = 57'h0e0233f515cb8ff;
    stim[55] = 57'h0deb09b799a3b60;
    stim[56] = 57'h0b2bee3abfeb5c8;
    stim[57] = 57'h18103236e9697ad;
    stim[58] = 57'h0706e3f833a6386;
    stim[59] = 57'h1db82cbfb32f2ea;
    stim[60] = 57'h0c96e7eb0fb97db;
    stim[61] = 57'h0484670b9aea340;
    stim[62] = 57'h1142dd29805566b;
    stim[63] = 57'h0ae1e3b9ea8db14;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'ha9c30747xxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'h9c8486e4xxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'h0a8e477exxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'he0f801c7xxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxx6be568a0;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxd0737b68;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxc66ba587;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxxxxxxxx6e9697ad;
      expv[63] = 64'hxxxxxxxxb194dd01;
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
