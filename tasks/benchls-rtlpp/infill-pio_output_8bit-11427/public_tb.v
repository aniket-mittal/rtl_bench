// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11427 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
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
    stim[0] = 37'h0018603613;
    stim[1] = 37'h1443883c9f;
    stim[2] = 37'h17ad1b66d6;
    stim[3] = 37'h1e4358572a;
    stim[4] = 37'h1672ed6420;
    stim[5] = 37'h03344b9790;
    stim[6] = 37'h074246ba1f;
    stim[7] = 37'h072e03e3a0;
    stim[8] = 37'h0e65a25e54;
    stim[9] = 37'h13963701f1;
    stim[10] = 37'h0fe621cafa;
    stim[11] = 37'h06bbd10caa;
    stim[12] = 37'h075e9e70c1;
    stim[13] = 37'h1ef7f94534;
    stim[14] = 37'h0f9075078b;
    stim[15] = 37'h0a41667444;
    stim[16] = 37'h120da1e85d;
    stim[17] = 37'h0bd68570ad;
    stim[18] = 37'h0267383e9d;
    stim[19] = 37'h1e0b3bf4dd;
    stim[20] = 37'h1e300c9314;
    stim[21] = 37'h1f724de206;
    stim[22] = 37'h01242f1c57;
    stim[23] = 37'h1f6b8b1a17;
    stim[24] = 37'h1e6e09945c;
    stim[25] = 37'h1b3961020d;
    stim[26] = 37'h1e948a0dd5;
    stim[27] = 37'h1ae14d8297;
    stim[28] = 37'h0aec7acb30;
    stim[29] = 37'h0374392eaa;
    stim[30] = 37'h0a7312ca3c;
    stim[31] = 37'h1bfbdb5ef3;
    stim[32] = 37'h067ae22b06;
    stim[33] = 37'h174dbcb99d;
    stim[34] = 37'h0ea1ce150f;
    stim[35] = 37'h1afe206433;
    stim[36] = 37'h03a85d9dc5;
    stim[37] = 37'h1a5336c6d8;
    stim[38] = 37'h1f65785ff7;
    stim[39] = 37'h176d8260bc;
    stim[40] = 37'h1e23707ba8;
    stim[41] = 37'h03167157e7;
    stim[42] = 37'h0ff971dfb0;
    stim[43] = 37'h1e28c76abf;
    stim[44] = 37'h164c7e92fd;
    stim[45] = 37'h02e1ee5988;
    stim[46] = 37'h0b97cede8b;
    stim[47] = 37'h079f48bd82;
    stim[48] = 37'h0e7f793d3e;
    stim[49] = 37'h0bd649ce57;
    stim[50] = 37'h03af4e7df3;
    stim[51] = 37'h1bc92a12a2;
    stim[52] = 37'h16e3b97fd4;
    stim[53] = 37'h1e39cc0689;
    stim[54] = 37'h0af7e99e07;
    stim[55] = 37'h07b13fd776;
    stim[56] = 37'h06455a5f84;
    stim[57] = 37'h1ade905327;
    stim[58] = 37'h131b71fea5;
    stim[59] = 37'h1f84f63b52;
    stim[60] = 37'h0a5f409bcc;
    stim[61] = 37'h07e71613fd;
    stim[62] = 37'h060e5bb020;
    stim[63] = 37'h0bbb1dbfc3;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'haa000000aa;
      expv[13] = 40'haa00000000;
      expv[14] = 40'haa00000000;
      expv[15] = 40'haa00000000;
      expv[16] = 40'haa00000000;
      expv[17] = 40'haa00000000;
      expv[18] = 40'haa000000aa;
      expv[19] = 40'haa00000000;
      expv[20] = 40'haa00000000;
      expv[21] = 40'haa00000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0600000000;
      expv[34] = 40'h0600000000;
      expv[35] = 40'h0600000000;
      expv[36] = 40'h0600000006;
      expv[37] = 40'h0600000000;
      expv[38] = 40'h0600000000;
      expv[39] = 40'h0600000000;
      expv[40] = 40'h0600000000;
      expv[41] = 40'h0600000006;
      expv[42] = 40'h0600000000;
      expv[43] = 40'h0600000000;
      expv[44] = 40'h0600000000;
      expv[45] = 40'h0600000006;
      expv[46] = 40'h0600000000;
      expv[47] = 40'h0600000006;
      expv[48] = 40'h0600000000;
      expv[49] = 40'h0600000000;
      expv[50] = 40'h0600000006;
      expv[51] = 40'h0600000000;
      expv[52] = 40'h0600000000;
      expv[53] = 40'h0600000000;
      expv[54] = 40'h0600000000;
      expv[55] = 40'h0600000006;
      expv[56] = 40'h0600000006;
      expv[57] = 40'h8400000000;
      expv[58] = 40'h8400000000;
      expv[59] = 40'h8400000000;
      expv[60] = 40'h8400000000;
      expv[61] = 40'h8400000084;
      expv[62] = 40'h8400000084;
      expv[63] = 40'h2000000000;
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
