// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01922 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .loadseed_i(in_vec[32:32]),
    .seed_i(in_vec[31:0]),
    .number_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2a226a9d4;
    stim[1] = 34'h368944d3f;
    stim[2] = 34'h06c8308a7;
    stim[3] = 34'h1d368fa32;
    stim[4] = 34'h0be8f8528;
    stim[5] = 34'h13f3d2012;
    stim[6] = 34'h1a66046ad;
    stim[7] = 34'h11a3c6c46;
    stim[8] = 34'h17849112b;
    stim[9] = 34'h0f8641fb7;
    stim[10] = 34'h04bfa1acb;
    stim[11] = 34'h05d64e081;
    stim[12] = 34'h10845d4b8;
    stim[13] = 34'h0314b77a7;
    stim[14] = 34'h067a47ec7;
    stim[15] = 34'h19af16624;
    stim[16] = 34'h02800b3bc;
    stim[17] = 34'h1d7be4bab;
    stim[18] = 34'h18ab24bdf;
    stim[19] = 34'h0f1bb3be1;
    stim[20] = 34'h057d54a85;
    stim[21] = 34'h1f342e1b3;
    stim[22] = 34'h054376350;
    stim[23] = 34'h071a0088b;
    stim[24] = 34'h1fb29f836;
    stim[25] = 34'h08bedc178;
    stim[26] = 34'h1ee01a829;
    stim[27] = 34'h0cc9c9980;
    stim[28] = 34'h0d671cea3;
    stim[29] = 34'h02eeac8ca;
    stim[30] = 34'h00a495191;
    stim[31] = 34'h111050fd0;
    stim[32] = 34'h01092cf1c;
    stim[33] = 34'h0dc85f2ac;
    stim[34] = 34'h1e47fe4ef;
    stim[35] = 34'h1eddfdb91;
    stim[36] = 34'h1c9fc20d7;
    stim[37] = 34'h17c8744b1;
    stim[38] = 34'h09de99946;
    stim[39] = 34'h08abf308f;
    stim[40] = 34'h0164c4d83;
    stim[41] = 34'h13e6abcbf;
    stim[42] = 34'h1f0dcf922;
    stim[43] = 34'h1b31e8d12;
    stim[44] = 34'h0f66e411f;
    stim[45] = 34'h041d1a646;
    stim[46] = 34'h09df54075;
    stim[47] = 34'h1c3829ec5;
    stim[48] = 34'h02688cd97;
    stim[49] = 34'h0d6422080;
    stim[50] = 34'h10830f18e;
    stim[51] = 34'h01387eb3b;
    stim[52] = 34'h147482e4a;
    stim[53] = 34'h0e9b657ab;
    stim[54] = 34'h0fdea7ac5;
    stim[55] = 34'h1191109c7;
    stim[56] = 34'h19f13f5c6;
    stim[57] = 34'h175e2fc22;
    stim[58] = 34'h0a2c7f286;
    stim[59] = 34'h055a15846;
    stim[60] = 34'h10f9fd207;
    stim[61] = 34'h0db90f51c;
    stim[62] = 34'h13f73b0ad;
    stim[63] = 34'h1b03cbeb1;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'ha6x1f46x;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'hb72c9856;
      expv[12] = 32'h34248895;
      expv[13] = 32'hd042aa03;
      expv[14] = 32'h06fe239b;
      expv[15] = 32'h793c02fc;
      expv[16] = 32'h0c22ea5c;
      expv[17] = 32'h506e84a4;
      expv[18] = 32'h71c766c2;
      expv[19] = 32'h449b1a0c;
      expv[20] = 32'h00000000;
      expv[21] = 32'hfa283485;
      expv[22] = 32'h4d5925ef;
      expv[23] = 32'h5a535026;
      expv[24] = 32'h37e15330;
      expv[25] = 32'h79a170d9;
      expv[26] = 32'h09a8344f;
      expv[27] = 32'ha250392f;
      expv[28] = 32'h32f042ef;
      expv[29] = 32'h6dc6a45e;
      expv[30] = 32'h7f00d414;
      expv[31] = 32'hd3101ce2;
      expv[32] = 32'hb660df9d;
      expv[33] = 32'h8b0c3ed6;
      expv[34] = 32'h8683c57e;
      expv[35] = 32'h088287e8;
      expv[36] = 32'hd392f5ee;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h1721621f;
      expv[41] = 32'h3643a258;
      expv[42] = 32'h0d1b4301;
      expv[43] = 32'h2b770eb2;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'hd981d318;
      expv[47] = 32'h598f4689;
      expv[48] = 32'h55adba9d;
      expv[49] = 32'ha746343d;
      expv[50] = 32'habf38dd5;
      expv[51] = 32'h61c14f62;
      expv[52] = 32'h667b6804;
      expv[53] = 32'he08d6682;
      expv[54] = 32'h7810f00c;
      expv[55] = 32'h5b31b591;
      expv[56] = 32'h23a41725;
      expv[57] = 32'h015922f3;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h1938538b;
      expv[61] = 32'h3af17e11;
      expv[62] = 32'hbb515f21;
      expv[63] = 32'h7631c368;
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
