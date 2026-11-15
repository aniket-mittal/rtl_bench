// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129029 dut (
    .i_clk(clk),
    .i_rst(in_vec[70:70]),
    .i_new_pc(in_vec[69:69]),
    .i_clear_cache(in_vec[68:68]),
    .i_stall_n(in_vec[67:67]),
    .i_pc(in_vec[66:35]),
    .i_wb_ack(in_vec[34:34]),
    .i_wb_stall(in_vec[33:33]),
    .i_wb_err(in_vec[32:32]),
    .i_wb_data(in_vec[31:0]),
    .o_i(out_vec[132:101]),
    .o_pc(out_vec[100:69]),
    .o_v(out_vec[68:68]),
    .o_wb_cyc(out_vec[67:67]),
    .o_wb_stb(out_vec[66:66]),
    .o_wb_we(out_vec[65:65]),
    .o_wb_addr(out_vec[64:33]),
    .o_wb_data(out_vec[32:1]),
    .o_illegal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h590a84a7105800f03c;
    stim[1] = 71'h4d7e36328422f43cc7;
    stim[2] = 71'h2cbb840ebfac4c4335;
    stim[3] = 71'h1d3ef3f48276639826;
    stim[4] = 71'h18757343f03be3cd1b;
    stim[5] = 71'h31acb6df0de031beaf;
    stim[6] = 71'h20c0a8196ec653f2c0;
    stim[7] = 71'h37bfadac99c0ae0869;
    stim[8] = 71'h054654ef7aa5b6eaae;
    stim[9] = 71'h2e621c6cb11b4926eb;
    stim[10] = 71'h01816740e1b40df386;
    stim[11] = 71'h17ff9d879fa19cd8a4;
    stim[12] = 71'h1a3b0483714c6ffd55;
    stim[13] = 71'h0b79764654f08ae79d;
    stim[14] = 71'h3a4473530f4bab0567;
    stim[15] = 71'h300c06db5d6273e918;
    stim[16] = 71'h08972651f4279d4448;
    stim[17] = 71'h0ad9b015cf022c4501;
    stim[18] = 71'h2f8daccf32e7649f5b;
    stim[19] = 71'h213d14cfafaca79a72;
    stim[20] = 71'h307dd962c8b638bd69;
    stim[21] = 71'h05d6ba3e2f9f95685e;
    stim[22] = 71'h26c63affa904374a8d;
    stim[23] = 71'h2e6eac182ecfbbfefe;
    stim[24] = 71'h0f26fe62f13b94b480;
    stim[25] = 71'h39672e3663d61ba9be;
    stim[26] = 71'h1da4aca73176b8913d;
    stim[27] = 71'h3c58d92cdf5e71baf2;
    stim[28] = 71'h1ece31d7995cb4d676;
    stim[29] = 71'h00a51cd00e541401a7;
    stim[30] = 71'h00e5dfb5906089b753;
    stim[31] = 71'h16e4d0a9f91b27e9fa;
    stim[32] = 71'h464de3263cc7d3f06f;
    stim[33] = 71'h25109b6cbacd866b83;
    stim[34] = 71'h1e33a8e674fdba18de;
    stim[35] = 71'h371c7f9d19c9913391;
    stim[36] = 71'h0682bce51a1ba8fe90;
    stim[37] = 71'h3d60d4f04061b0b5d1;
    stim[38] = 71'h0c684781169725fb35;
    stim[39] = 71'h1104393400f504f064;
    stim[40] = 71'h211782161cff55b8ae;
    stim[41] = 71'h1b3d541b9cfea611a6;
    stim[42] = 71'h2bff56209657d11c6b;
    stim[43] = 71'h2836a8f3c0315324ee;
    stim[44] = 71'h054e8d7d1eda578e4b;
    stim[45] = 71'h271dd856dad007e166;
    stim[46] = 71'h3e72db8690c1c11786;
    stim[47] = 71'h212c36ac894a2314f3;
    stim[48] = 71'h2ddf133d8772c66fbd;
    stim[49] = 71'h1da74492569d0e9989;
    stim[50] = 71'h3441f905e05ce23fa7;
    stim[51] = 71'h3870cbeb75a35c41fd;
    stim[52] = 71'h3bc4abcaefc6c99fed;
    stim[53] = 71'h1cef7c5ad5b2a9ce22;
    stim[54] = 71'h3d1ea76041bf48bc56;
    stim[55] = 71'h43c2b4f03dc999873d;
    stim[56] = 71'h2a3ecd1ed774ff509a;
    stim[57] = 71'h076df2d533f570afb3;
    stim[58] = 71'h1c3ae93101402d809e;
    stim[59] = 71'h293288745d4f042f29;
    stim[60] = 71'h29a17dfc88a9f21770;
    stim[61] = 71'h28ff8454a19c3a3024;
    stim[62] = 71'h25d63bb3bc18da26d9;
    stim[63] = 71'h12cabdbafe7b023358;
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
      expv[0] = 133'h0000000000000000000000000000000000;
      expv[1] = 133'h0000000000000000000000000000000000;
      expv[2] = 133'h0000000000000000000000000000000000;
      expv[3] = 133'h0000000012ee103aed2ee103ae00000000;
      expv[4] = 133'h0000000012ee103aed2ee103ae00000000;
      expv[5] = 133'h0000000012ee103aed2ee103ae00000000;
      expv[6] = 133'h0000000012ee103aed2ee103ae00000001;
      expv[7] = 133'h0000000012ee103aed2ee103ae00000001;
      expv[8] = 133'h0000000012ee103aed2ee103ae00000001;
      expv[9] = 133'h0000000012ee103aed2ee103ae00000001;
      expv[10] = 133'h00000000198871b2cd98871b2c00000001;
      expv[11] = 133'h00000000198871b2cd98871b2c00000001;
      expv[12] = 133'h00000000198871b2cd98871b2c00000001;
      expv[13] = 133'h00000000198871b2cd98871b2c00000001;
      expv[14] = 133'h1e115cf3b98871b2d198871b2c00000001;
      expv[15] = 133'h1e115cf3b98871b2d198871b2c00000001;
      expv[16] = 133'h1e115cf3b98871b2d198871b2c00000001;
      expv[17] = 133'h1e115cf3b98871b2d198871b2c00000001;
      expv[18] = 133'h1e115cf3b98871b2d198871b2c00000001;
      expv[19] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[20] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[21] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[22] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[23] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[24] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[25] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[26] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[27] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[28] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[29] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[30] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[31] = 133'h1e115cf3be36b33cdde36b33cc00000001;
      expv[32] = 133'h0000000000000000000000000000000000;
      expv[33] = 133'h0000000000000000000000000000000000;
      expv[34] = 133'h0000000000000000000000000000000000;
      expv[35] = 133'h0000000000000000000000000000000000;
      expv[36] = 133'h0000000000000000000000000000000000;
      expv[37] = 133'h0000000000000000000000000000000000;
      expv[38] = 133'h0000000000000000000000000000000000;
      expv[39] = 133'h0000000000000000000000000000000000;
      expv[40] = 133'h0000000000000000000000000000000000;
      expv[41] = 133'h0000000000000000000000000000000000;
      expv[42] = 133'h0000000000000000000000000000000000;
      expv[43] = 133'h000000000ffd58824cffd5882400000000;
      expv[44] = 133'h000000000ffd58824cffd5882400000000;
      expv[45] = 133'h000000000ffd58824cffd5882400000000;
      expv[46] = 133'h000000000ffd58824cffd5882400000000;
      expv[47] = 133'h000000000ffd58824cffd5882400000000;
      expv[48] = 133'h000000000ffd58824cffd5882400000000;
      expv[49] = 133'h000000000ffd58824cffd5882400000000;
      expv[50] = 133'h000000000ffd58824cffd5882400000000;
      expv[51] = 133'h000000000ffd58824cffd5882400000000;
      expv[52] = 133'h000000000ffd58824cffd5882400000001;
      expv[53] = 133'h000000000ffd58824cffd5882400000001;
      expv[54] = 133'h000000000ffd58824cffd5882400000001;
      expv[55] = 133'h0000000000000000000000000000000000;
      expv[56] = 133'h0000000000000000000000000000000000;
      expv[57] = 133'h0000000008fb347b4c8fb347b400000000;
      expv[58] = 133'h0000000008fb347b4c8fb347b400000000;
      expv[59] = 133'h0000000008fb347b4c8fb347b400000000;
      expv[60] = 133'h0000000008fb347b4c8fb347b400000001;
      expv[61] = 133'h000000000685f7f22c685f7f2200000001;
      expv[62] = 133'h000000000685f7f22c685f7f2200000001;
      expv[63] = 133'h031b44db2685f7f230685f7f2200000001;
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
