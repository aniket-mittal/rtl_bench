// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00204 dut (
    .value1(in_vec[68:37]),
    .value2(in_vec[36:5]),
    .shift_hex(in_vec[4:1]),
    .EN(in_vec[0:0]),
    .value_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h1155a1bd4a5e2dc5ad;
    stim[1] = 69'h1500e104f51bf37532;
    stim[2] = 69'h18426452b15773642b;
    stim[3] = 69'h07708e8cce2da95ada;
    stim[4] = 69'h01e862cf33ba0afe78;
    stim[5] = 69'h1f8e6bbaa58d8ede7c;
    stim[6] = 69'h01f2e42045bd014fee;
    stim[7] = 69'h09c82173713ed6abe9;
    stim[8] = 69'h00b4f4dc4825e1e29d;
    stim[9] = 69'h13720c9e9ee3a6580c;
    stim[10] = 69'h0efacbb48561f4f1d2;
    stim[11] = 69'h149bb9948e2b63d6ba;
    stim[12] = 69'h108b04f3f75ec7c32d;
    stim[13] = 69'h19510137b6588e9b6e;
    stim[14] = 69'h111fcbb4fc633bc30d;
    stim[15] = 69'h05f5a0fbb6a8993ae5;
    stim[16] = 69'h1b11b59387305f4f9e;
    stim[17] = 69'h14314b943ce6eb26a7;
    stim[18] = 69'h0b1bc16a38895ff7da;
    stim[19] = 69'h1b23cdd115f8508d1f;
    stim[20] = 69'h0dcc6467497110e0fc;
    stim[21] = 69'h08bfbfe8e75cb867a3;
    stim[22] = 69'h0f7c2552b5ab269a8b;
    stim[23] = 69'h01bebbf867cbe464a1;
    stim[24] = 69'h1f40dc6be18bd1af9b;
    stim[25] = 69'h18fac3fdbc83548397;
    stim[26] = 69'h1dff32f42b98cfa216;
    stim[27] = 69'h0652e7d6f4927c9378;
    stim[28] = 69'h1e2bc663f0c1fb30b5;
    stim[29] = 69'h0cde6ddd8adf637478;
    stim[30] = 69'h170880e797d41df4fa;
    stim[31] = 69'h1d7fac482ccd149fae;
    stim[32] = 69'h02cf1a59d564c85676;
    stim[33] = 69'h0828a8cdb4a65f0d53;
    stim[34] = 69'h1dacb53910014ca96d;
    stim[35] = 69'h1415103a915466c108;
    stim[36] = 69'h0ae2f1b05b8f2fae85;
    stim[37] = 69'h1fd9e550f37bbbc771;
    stim[38] = 69'h1aee5027184ac9c776;
    stim[39] = 69'h19e6d26849bce2dec6;
    stim[40] = 69'h1e67806d5047312651;
    stim[41] = 69'h0e90261d92797e7b4c;
    stim[42] = 69'h1949055df066f42340;
    stim[43] = 69'h0087c201b3d01c1ed7;
    stim[44] = 69'h0089e3fc185770f742;
    stim[45] = 69'h1e90eba5bad7adf537;
    stim[46] = 69'h1ed601f31a215b29bc;
    stim[47] = 69'h190b92b311c2880553;
    stim[48] = 69'h01e7e6c5cd1e7486ec;
    stim[49] = 69'h114b8f77ab4c9506ce;
    stim[50] = 69'h1ceaf936aebebf9177;
    stim[51] = 69'h133a5c7fdf95f0fad1;
    stim[52] = 69'h14a422ecf7fa5f53d1;
    stim[53] = 69'h0b4aade2eec7c677d2;
    stim[54] = 69'h12bfcaab4993a5601b;
    stim[55] = 69'h0fdda9a7b98b390a02;
    stim[56] = 69'h1855bb0b5e4fe2ecac;
    stim[57] = 69'h067cd921f3b57e8ab3;
    stim[58] = 69'h10b4342947a0d5fd4b;
    stim[59] = 69'h0bff0cfd855fa43919;
    stim[60] = 69'h18a10ad3217d29015b;
    stim[61] = 69'h145ddf2200690f49e2;
    stim[62] = 69'h0dc0af697edc507e5c;
    stim[63] = 69'h09aecbb37c4eb62995;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
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
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
