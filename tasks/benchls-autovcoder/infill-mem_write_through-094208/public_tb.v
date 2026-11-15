// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_094208 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[74:74]),
    .wr_en_i(in_vec[73:73]),
    .rst_i(in_vec[72:72]),
    .wr_data_i(in_vec[71:36]),
    .mem_out_i(in_vec[35:0]),
    .rd_data_o(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h3202e3748cf4f706464;
    stim[1] = 75'h52221ebe1902ff69410;
    stim[2] = 75'h45ee554243a8423457d;
    stim[3] = 75'h2940fc1db11e29102d9;
    stim[4] = 75'h0a8e85f7b03839265e4;
    stim[5] = 75'h6a81d3169414a4e2473;
    stim[6] = 75'h600831a445160428a23;
    stim[7] = 75'h0b75c3f34c9f0ea5327;
    stim[8] = 75'h4a4247f77699d6f1aae;
    stim[9] = 75'h237f574e4c99a30b2a5;
    stim[10] = 75'h01cec90f265ce88ee14;
    stim[11] = 75'h049794a7744e8a1b0a2;
    stim[12] = 75'h23caecbb868fa209c71;
    stim[13] = 75'h00b6761731c3c7c1b97;
    stim[14] = 75'h021b397d00aa59a8013;
    stim[15] = 75'h47376c6f870cb125728;
    stim[16] = 75'h2834ab733120d14a44c;
    stim[17] = 75'h0af61164fbd313cb632;
    stim[18] = 75'h2a382ffd90b09372ee8;
    stim[19] = 75'h61c69741d30964827d9;
    stim[20] = 75'h6891f3a94d02fff7a99;
    stim[21] = 75'h4c1ca819faf01c41b6e;
    stim[22] = 75'h232f8e9964b2f13aa7c;
    stim[23] = 75'h48ea469070cc647f6fd;
    stim[24] = 75'h6d1b88a6c1262a20f97;
    stim[25] = 75'h04bdbb87287304b739a;
    stim[26] = 75'h2c141410ebe2e93df80;
    stim[27] = 75'h0ba003c840953003f5f;
    stim[28] = 75'h0734764c4c40bf02cd8;
    stim[29] = 75'h2c4224c0429719acd15;
    stim[30] = 75'h6eba43960d281e41dfe;
    stim[31] = 75'h059e1866259137b6f97;
    stim[32] = 75'h03884aa876f0f8917a0;
    stim[33] = 75'h088b692d1911e5006b2;
    stim[34] = 75'h4724e0b83eea1e47208;
    stim[35] = 75'h4365dcad5eda57fe43a;
    stim[36] = 75'h2a492a56e86b602cdab;
    stim[37] = 75'h608e426d0aee04e6e35;
    stim[38] = 75'h0a8bbd4dedd9066511d;
    stim[39] = 75'h5578feb51f7440b9b9e;
    stim[40] = 75'h242c239cf683c165d64;
    stim[41] = 75'h09a51682e97fba0e50b;
    stim[42] = 75'h40b0ca98959ce5f6a63;
    stim[43] = 75'h43ca5b2e679383bc16e;
    stim[44] = 75'h2206739b65d224c63dd;
    stim[45] = 75'h2d902e21d836f31d037;
    stim[46] = 75'h6d76f455b48a8ff85cf;
    stim[47] = 75'h2d59fdaa4494d4fa52a;
    stim[48] = 75'h0e5743a3f13fd737911;
    stim[49] = 75'h46a73ee0a5e5c15c003;
    stim[50] = 75'h2ff72d3ffe45285e9dd;
    stim[51] = 75'h4fab42ae4bcc2dbc4e7;
    stim[52] = 75'h475545325cbdcd91da4;
    stim[53] = 75'h262fcd7b24080cec1c4;
    stim[54] = 75'h0e4c060c3841fad7123;
    stim[55] = 75'h47acc22775260dae5d7;
    stim[56] = 75'h29ca5488786a065fe9c;
    stim[57] = 75'h6df06a95c2be25fbfb9;
    stim[58] = 75'h2ce0e37d28d2c2770bf;
    stim[59] = 75'h02ca9a155a6e3ec9d0a;
    stim[60] = 75'h4cd8d11b64dd3937f36;
    stim[61] = 75'h07e81491fa254a3a940;
    stim[62] = 75'h4799c3ade67048518c8;
    stim[63] = 75'h05292bdf28a8a4d4a30;
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
      expv[0] = 36'hf4f706464;
      expv[1] = 36'h02ff69410;
      expv[2] = 36'ha8423457d;
      expv[3] = 36'h1e29102d9;
      expv[4] = 36'h3839265e4;
      expv[5] = 36'h14a4e2473;
      expv[6] = 36'h160428a23;
      expv[7] = 36'h9f0ea5327;
      expv[8] = 36'h99d6f1aae;
      expv[9] = 36'h99a30b2a5;
      expv[10] = 36'h5ce88ee14;
      expv[11] = 36'h4e8a1b0a2;
      expv[12] = 36'h8fa209c71;
      expv[13] = 36'hc3c7c1b97;
      expv[14] = 36'haa59a8013;
      expv[15] = 36'h0cb125728;
      expv[16] = 36'h20d14a44c;
      expv[17] = 36'hd313cb632;
      expv[18] = 36'hb09372ee8;
      expv[19] = 36'h0964827d9;
      expv[20] = 36'h02fff7a99;
      expv[21] = 36'hf01c41b6e;
      expv[22] = 36'hb2f13aa7c;
      expv[23] = 36'hcc647f6fd;
      expv[24] = 36'h262a20f97;
      expv[25] = 36'h7304b739a;
      expv[26] = 36'he2e93df80;
      expv[27] = 36'h953003f5f;
      expv[28] = 36'h40bf02cd8;
      expv[29] = 36'h9719acd15;
      expv[30] = 36'h281e41dfe;
      expv[31] = 36'h9137b6f97;
      expv[32] = 36'hf0f8917a0;
      expv[33] = 36'h11e5006b2;
      expv[34] = 36'hea1e47208;
      expv[35] = 36'hda57fe43a;
      expv[36] = 36'h6b602cdab;
      expv[37] = 36'hee04e6e35;
      expv[38] = 36'hd9066511d;
      expv[39] = 36'h7440b9b9e;
      expv[40] = 36'h83c165d64;
      expv[41] = 36'h7fba0e50b;
      expv[42] = 36'h9ce5f6a63;
      expv[43] = 36'h9383bc16e;
      expv[44] = 36'hd224c63dd;
      expv[45] = 36'h36f31d037;
      expv[46] = 36'h8a8ff85cf;
      expv[47] = 36'h94d4fa52a;
      expv[48] = 36'h3fd737911;
      expv[49] = 36'he5c15c003;
      expv[50] = 36'h45285e9dd;
      expv[51] = 36'hcc2dbc4e7;
      expv[52] = 36'hbdcd91da4;
      expv[53] = 36'h080cec1c4;
      expv[54] = 36'h41fad7123;
      expv[55] = 36'h260dae5d7;
      expv[56] = 36'h6a065fe9c;
      expv[57] = 36'hbe25fbfb9;
      expv[58] = 36'hd2c2770bf;
      expv[59] = 36'h6e3ec9d0a;
      expv[60] = 36'hdd3937f36;
      expv[61] = 36'h254a3a940;
      expv[62] = 36'h7048518c8;
      expv[63] = 36'ha8a4d4a30;
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
