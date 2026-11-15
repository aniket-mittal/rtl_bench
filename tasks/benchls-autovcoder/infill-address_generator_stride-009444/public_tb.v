// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_009444 dut (
    .clk(clk),
    .address_latch(in_vec[33:33]),
    .rst(in_vec[32:32]),
    .starting_address(in_vec[31:0]),
    .address_o(out_vec[32:1]),
    .address_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3a96de520;
    stim[1] = 34'h1c4dc644f;
    stim[2] = 34'h2dfa95f43;
    stim[3] = 34'h050f0d3f9;
    stim[4] = 34'h2ed56d7e3;
    stim[5] = 34'h2bccef15b;
    stim[6] = 34'h0080ebcf4;
    stim[7] = 34'h0d5b39bf2;
    stim[8] = 34'h0ee8c4597;
    stim[9] = 34'h05194283c;
    stim[10] = 34'h043599e85;
    stim[11] = 34'h265591e62;
    stim[12] = 34'h027de3967;
    stim[13] = 34'h22e83c5d6;
    stim[14] = 34'h27da5d7a7;
    stim[15] = 34'h20078e002;
    stim[16] = 34'h257d94ee1;
    stim[17] = 34'h0704ff59d;
    stim[18] = 34'h00d83314e;
    stim[19] = 34'h23a4a0753;
    stim[20] = 34'h069685b2d;
    stim[21] = 34'h2c8cc53d7;
    stim[22] = 34'h0059950e9;
    stim[23] = 34'h0ab31bfce;
    stim[24] = 34'h2d173db7a;
    stim[25] = 34'h0211182a8;
    stim[26] = 34'h2194b3db5;
    stim[27] = 34'h20190d0c2;
    stim[28] = 34'h2c3c6b0a4;
    stim[29] = 34'h281ea3b9a;
    stim[30] = 34'h22978a235;
    stim[31] = 34'h0e73c05f1;
    stim[32] = 34'h0d842fb31;
    stim[33] = 34'h246bc01f8;
    stim[34] = 34'h29760bf80;
    stim[35] = 34'h26ca8424b;
    stim[36] = 34'h01527a2ea;
    stim[37] = 34'h098411299;
    stim[38] = 34'h21af5f222;
    stim[39] = 34'h0a9f05dbc;
    stim[40] = 34'h0bcab322c;
    stim[41] = 34'h24eeb6c79;
    stim[42] = 34'h29726949b;
    stim[43] = 34'h2a5a33741;
    stim[44] = 34'h21e8617c3;
    stim[45] = 34'h24338c529;
    stim[46] = 34'h2eadad5fc;
    stim[47] = 34'h2f8bc587d;
    stim[48] = 34'h07a91f68a;
    stim[49] = 34'h203a4e910;
    stim[50] = 34'h052bf70db;
    stim[51] = 34'h25c5435b3;
    stim[52] = 34'h02e2aeb79;
    stim[53] = 34'h0109e23ee;
    stim[54] = 34'h2d46175ba;
    stim[55] = 34'h00799bb42;
    stim[56] = 34'h098fc379e;
    stim[57] = 34'h000920d35;
    stim[58] = 34'h20f16be92;
    stim[59] = 34'h0bfb33d46;
    stim[60] = 34'h041fe0f2a;
    stim[61] = 34'h2e11283f2;
    stim[62] = 34'h287fbeb4c;
    stim[63] = 34'h20e87004b;
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
      expv[3] = 33'h000000101;
      expv[4] = 33'h000000101;
      expv[5] = 33'h000000201;
      expv[6] = 33'h000000301;
      expv[7] = 33'h000000301;
      expv[8] = 33'h000000301;
      expv[9] = 33'h000000301;
      expv[10] = 33'h000000301;
      expv[11] = 33'h000000301;
      expv[12] = 33'h000000401;
      expv[13] = 33'h000000401;
      expv[14] = 33'h000000501;
      expv[15] = 33'h000000601;
      expv[16] = 33'h000000701;
      expv[17] = 33'h000000801;
      expv[18] = 33'h000000801;
      expv[19] = 33'h000000801;
      expv[20] = 33'h000000901;
      expv[21] = 33'h000000901;
      expv[22] = 33'h000000a01;
      expv[23] = 33'h000000a01;
      expv[24] = 33'h000000a01;
      expv[25] = 33'h000000b01;
      expv[26] = 33'h000000b01;
      expv[27] = 33'h000000c01;
      expv[28] = 33'h000000d01;
      expv[29] = 33'h000000e01;
      expv[30] = 33'h000000f01;
      expv[31] = 33'h000001001;
      expv[32] = 33'h000001001;
      expv[33] = 33'h000001001;
      expv[34] = 33'h000001101;
      expv[35] = 33'h000001201;
      expv[36] = 33'h000001301;
      expv[37] = 33'h000001301;
      expv[38] = 33'h000001301;
      expv[39] = 33'h000001401;
      expv[40] = 33'h000001401;
      expv[41] = 33'h000001401;
      expv[42] = 33'h000001501;
      expv[43] = 33'h000001601;
      expv[44] = 33'h000001701;
      expv[45] = 33'h000001801;
      expv[46] = 33'h000001901;
      expv[47] = 33'h000001a01;
      expv[48] = 33'h000001b01;
      expv[49] = 33'h000001b01;
      expv[50] = 33'h000001c01;
      expv[51] = 33'h000001c01;
      expv[52] = 33'h000001d01;
      expv[53] = 33'h000001d01;
      expv[54] = 33'h000001d01;
      expv[55] = 33'h000001e01;
      expv[56] = 33'h000001e01;
      expv[57] = 33'h000001e01;
      expv[58] = 33'h000001e01;
      expv[59] = 33'h000001f01;
      expv[60] = 33'h000001f01;
      expv[61] = 33'h000001f01;
      expv[62] = 33'h000002001;
      expv[63] = 33'h000002101;
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
