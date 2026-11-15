// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_061407 dut (
    .clk(clk),
    .clk_en(in_vec[66:66]),
    .reset(in_vec[65:65]),
    .start(in_vec[64:64]),
    .dataa(in_vec[63:32]),
    .datab(in_vec[31:0]),
    .result(out_vec[32:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h2b5c668ef70304837;
    stim[1] = 67'h358c06910526e1c36;
    stim[2] = 67'h4047cb85aabfd14d8;
    stim[3] = 67'h4a139fd504106e512;
    stim[4] = 67'h1bc6a00e09767761c;
    stim[5] = 67'h109a004c1c28eaabd;
    stim[6] = 67'h5bb6885d0d7f033e2;
    stim[7] = 67'h4d22643e85f60a444;
    stim[8] = 67'h56c3a25efb5a6e723;
    stim[9] = 67'h130684c6b1c56cdc7;
    stim[10] = 67'h493f674b760fc84ca;
    stim[11] = 67'h1b3a336665a3ac4cf;
    stim[12] = 67'h080edac510f4d3e5b;
    stim[13] = 67'h015e2bc553041d5a1;
    stim[14] = 67'h093341040cd7b157d;
    stim[15] = 67'h5f939a2daa3736a3d;
    stim[16] = 67'h523bbe251dbcce3ad;
    stim[17] = 67'h529f0665da5087525;
    stim[18] = 67'h4462988d714a5606f;
    stim[19] = 67'h151a8ff26fa4e16df;
    stim[20] = 67'h1f9e52455435cb58d;
    stim[21] = 67'h58ec46926ea395725;
    stim[22] = 67'h1c1119473e9e7a7b9;
    stim[23] = 67'h52eb5e3248cfe74c2;
    stim[24] = 67'h0243725b74d3d820a;
    stim[25] = 67'h11907339c2bee0b3e;
    stim[26] = 67'h5a2c9fb132552b5a0;
    stim[27] = 67'h0ec1e574804138a86;
    stim[28] = 67'h1901ce09904b41a37;
    stim[29] = 67'h03436010471caf4e8;
    stim[30] = 67'h003cfc4b03b91daee;
    stim[31] = 67'h5172b61c3ef4abc3b;
    stim[32] = 67'h51f806e2d16040f0c;
    stim[33] = 67'h0c8fbdfe63662a4d7;
    stim[34] = 67'h0084ca865ff1f9737;
    stim[35] = 67'h17a8d494cc8b49666;
    stim[36] = 67'h451f6e22e1ff9619e;
    stim[37] = 67'h4a42f74bda39f935c;
    stim[38] = 67'h1252ad55cb1c80757;
    stim[39] = 67'h111a2baf1b4dec4df;
    stim[40] = 67'h56a0410b3b06a1cc1;
    stim[41] = 67'h5e5439dec7ae0e3d1;
    stim[42] = 67'h1efccac17e06fb48a;
    stim[43] = 67'h1eeaf7a2ad6b16e2e;
    stim[44] = 67'h1504b4a18565c959d;
    stim[45] = 67'h44b9f70af5acb7ed1;
    stim[46] = 67'h0ffd162b2880cff4e;
    stim[47] = 67'h03fc323209045da06;
    stim[48] = 67'h4897670876dd36316;
    stim[49] = 67'h5b53c4c18d491bbca;
    stim[50] = 67'h1986914226951df92;
    stim[51] = 67'h59eb8c21a3dee1cf1;
    stim[52] = 67'h5007ddbfa08c7d43d;
    stim[53] = 67'h0b05bea8bb4c4a2b8;
    stim[54] = 67'h5c568eb32af6fe51b;
    stim[55] = 67'h0a1e96e809a4e593e;
    stim[56] = 67'h1b96cba9c945fb291;
    stim[57] = 67'h4bdb6eee064673944;
    stim[58] = 67'h0b7eafff83825a50b;
    stim[59] = 67'h111341a63f23cb056;
    stim[60] = 67'h1011d768c6a0904d8;
    stim[61] = 67'h10184b7f38c356955;
    stim[62] = 67'h0eaaa8984da4c1849;
    stim[63] = 67'h1a1528a0013194585;
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
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
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
