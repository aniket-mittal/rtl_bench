// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09586 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h20227b988c4b3c0d1e;
    stim[1] = 70'h2c30872cc566067d82;
    stim[2] = 70'h108a79e5d24fdf992a;
    stim[3] = 70'h0f2df6db6887ac724a;
    stim[4] = 70'h1756e693290eb9ae35;
    stim[5] = 70'h0522c0d8df7178ab1d;
    stim[6] = 70'h171bbf844ccd78e20d;
    stim[7] = 70'h0c86264faf6033833c;
    stim[8] = 70'h000f8205f164d261d6;
    stim[9] = 70'h11638f48b1d46d8a9e;
    stim[10] = 70'h0b41aa5d8bac9977e1;
    stim[11] = 70'h18815a82c7b72fe4df;
    stim[12] = 70'h01ea5ceec6d2e36a94;
    stim[13] = 70'h1bcc9bf3aa8ab1ca7b;
    stim[14] = 70'h057b186315adc4073a;
    stim[15] = 70'h099190c1e1e85f9702;
    stim[16] = 70'h0247d0e842a8951338;
    stim[17] = 70'h00b91b169b65e5ff2b;
    stim[18] = 70'h0d49d247f6f31ff0f5;
    stim[19] = 70'h009ea2505eb0487405;
    stim[20] = 70'h0de14734a00646385d;
    stim[21] = 70'h024090297696c8370a;
    stim[22] = 70'h1ce66523cddf67c4fc;
    stim[23] = 70'h13a76c45f1428fc507;
    stim[24] = 70'h0baa878ccad5d1c3c9;
    stim[25] = 70'h14d91bd80a8ab84edc;
    stim[26] = 70'h1fb9a50a94b6689ccb;
    stim[27] = 70'h019aa12ad98fb8645a;
    stim[28] = 70'h1cebac826c1f03b0ab;
    stim[29] = 70'h1855a1b54d27047472;
    stim[30] = 70'h20722c43f75ffc9afc;
    stim[31] = 70'h146ace931097fb2460;
    stim[32] = 70'h006b0b657c07116a4a;
    stim[33] = 70'h0a5fad15fb793c06d8;
    stim[34] = 70'h1a3b55d72f0b13bba0;
    stim[35] = 70'h07208a197e3baae7ea;
    stim[36] = 70'h07bc966cf2ab1d0c7c;
    stim[37] = 70'h079d4bf06474cfa55d;
    stim[38] = 70'h08065d1019d7d83e70;
    stim[39] = 70'h01f4905ef277038999;
    stim[40] = 70'h0d4ad8dacc419239cb;
    stim[41] = 70'h01df893e2847584517;
    stim[42] = 70'h07b74c4619580930cf;
    stim[43] = 70'h1b1bf2f1437cf17659;
    stim[44] = 70'h08cd2d8956f97188e1;
    stim[45] = 70'h0e60cd7435dd5be4dc;
    stim[46] = 70'h136bd9f9eaf7d88b4a;
    stim[47] = 70'h172ccaf6d9d9574ae3;
    stim[48] = 70'h0067e450e265c846f3;
    stim[49] = 70'h138373cbc37c505475;
    stim[50] = 70'h1abf05402e9bcd2ea4;
    stim[51] = 70'h039300db6eabb06337;
    stim[52] = 70'h05220ead8a73176813;
    stim[53] = 70'h1734aea5739e10ca59;
    stim[54] = 70'h1a6577db2df65df3d3;
    stim[55] = 70'h1504310bc8b8a222ee;
    stim[56] = 70'h01a82dd81804a6ced6;
    stim[57] = 70'h1df923a73e57e4bbc6;
    stim[58] = 70'h0296200306cf03a392;
    stim[59] = 70'h1ba847821333b50a3a;
    stim[60] = 70'h08b89f753f4220e61b;
    stim[61] = 70'h082a67873a09ebee2d;
    stim[62] = 70'h0f6ac25ee74662339c;
    stim[63] = 70'h02b15bee42bbaf2921;
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
      expv[0] = 33'h04b3c0d1e;
      expv[1] = 33'h166067d82;
      expv[2] = 33'h04fdf992a;
      expv[3] = 33'h087ac724a;
      expv[4] = 33'h10eb9ae34;
      expv[5] = 33'h17178ab1c;
      expv[6] = 33'h0cd78e20c;
      expv[7] = 33'h16033833c;
      expv[8] = 33'h164d261d6;
      expv[9] = 33'h1d46d8a9f;
      expv[10] = 33'h1ac9977e0;
      expv[11] = 33'h1b72fe4de;
      expv[12] = 33'h0d2e36a94;
      expv[13] = 33'h08ab1ca7a;
      expv[14] = 33'h1adc4073a;
      expv[15] = 33'h1e85f9702;
      expv[16] = 33'h0a8951338;
      expv[17] = 33'h165e5ff2a;
      expv[18] = 33'h0f31ff0f4;
      expv[19] = 33'h0b0487404;
      expv[20] = 33'h00646385c;
      expv[21] = 33'h096c8370a;
      expv[22] = 33'h1df67c4fc;
      expv[23] = 33'h1428fc506;
      expv[24] = 33'h0d5d1c3c8;
      expv[25] = 33'h08ab84edc;
      expv[26] = 33'h0b6689cca;
      expv[27] = 33'h18fb8645a;
      expv[28] = 33'h01f03b0aa;
      expv[29] = 33'h127047472;
      expv[30] = 33'h15ffc9afc;
      expv[31] = 33'h097fb2461;
      expv[32] = 33'h007116a4a;
      expv[33] = 33'h1793c06d8;
      expv[34] = 33'h10b13bba0;
      expv[35] = 33'h03baae7ea;
      expv[36] = 33'h0ab1d0c7c;
      expv[37] = 33'h074cfa55c;
      expv[38] = 33'h1d7d83e70;
      expv[39] = 33'h077038998;
      expv[40] = 33'h0419239ca;
      expv[41] = 33'h047584516;
      expv[42] = 33'h1580930ce;
      expv[43] = 33'h17cf17658;
      expv[44] = 33'h0f97188e0;
      expv[45] = 33'h1dd5be4dc;
      expv[46] = 33'h0f7d88b4a;
      expv[47] = 33'h1d9574ae2;
      expv[48] = 33'h065c846f2;
      expv[49] = 33'h17c505474;
      expv[50] = 33'h09bcd2ea4;
      expv[51] = 33'h0abb06336;
      expv[52] = 33'h073176812;
      expv[53] = 33'h19e10ca58;
      expv[54] = 33'h1f65df3d2;
      expv[55] = 33'h0b8a222ef;
      expv[56] = 33'h004a6ced6;
      expv[57] = 33'h057e4bbc6;
      expv[58] = 33'h0cf03a392;
      expv[59] = 33'h133b50a3a;
      expv[60] = 33'h14220e61a;
      expv[61] = 33'h009ebee2c;
      expv[62] = 33'h14662339c;
      expv[63] = 33'h0bbaf2920;
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
