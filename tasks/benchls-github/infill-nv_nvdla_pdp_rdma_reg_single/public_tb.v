// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  NV_NVDLA_PDP_RDMA_REG_single dut (
    .nvdla_core_clk(clk),
    .reg_offset(in_vec[50:39]),
    .reg_wr_data(in_vec[38:7]),
    .reg_wr_en(in_vec[6:6]),
    .nvdla_core_rstn(in_vec[5:5]),
    .consumer(in_vec[4:4]),
    .status_0(in_vec[3:2]),
    .status_1(in_vec[1:0]),
    .reg_rd_data(out_vec[32:1]),
    .producer(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h55b38c82c288f;
    stim[1] = 51'h3eea6ea66dc45;
    stim[2] = 51'h04e06e5251d3c;
    stim[3] = 51'h4e5648d6e09b9;
    stim[4] = 51'h204b7f01ee920;
    stim[5] = 51'h6363c248d9328;
    stim[6] = 51'h2d140b4a4e6fe;
    stim[7] = 51'h75d9f78e95de7;
    stim[8] = 51'h10e74a0dd72a8;
    stim[9] = 51'h65fc7b962f1f2;
    stim[10] = 51'h7706da88931b8;
    stim[11] = 51'h2e9e2c5006366;
    stim[12] = 51'h21715523c9636;
    stim[13] = 51'h7688c277f282c;
    stim[14] = 51'h6fefee1de4d7a;
    stim[15] = 51'h5493d35838379;
    stim[16] = 51'h5d191524205f4;
    stim[17] = 51'h5ed2bb12d3fb5;
    stim[18] = 51'h7ab0824e09a65;
    stim[19] = 51'h3635fce86ea24;
    stim[20] = 51'h451d3133638e7;
    stim[21] = 51'h37a49f5aced6e;
    stim[22] = 51'h00a1001ec233e;
    stim[23] = 51'h4b6a687de93b1;
    stim[24] = 51'h06dc5f5428728;
    stim[25] = 51'h47a0bc6f073ad;
    stim[26] = 51'h4c901e7ea9f60;
    stim[27] = 51'h2876ac9fc40fd;
    stim[28] = 51'h10c6ec7f496a5;
    stim[29] = 51'h6b961c0e16376;
    stim[30] = 51'h07a5eb281f674;
    stim[31] = 51'h475d050984231;
    stim[32] = 51'h3fe61bb69072f;
    stim[33] = 51'h62e124e73a477;
    stim[34] = 51'h477da4eefe164;
    stim[35] = 51'h60b40b24280f3;
    stim[36] = 51'h27d25ca2abbb5;
    stim[37] = 51'h0bec9aedc36b4;
    stim[38] = 51'h51ed1e03a3031;
    stim[39] = 51'h1eda1e5feb9ac;
    stim[40] = 51'h5e3dfc23e3b2f;
    stim[41] = 51'h159b724ead76d;
    stim[42] = 51'h0553396527e20;
    stim[43] = 51'h3e97ada364de6;
    stim[44] = 51'h28ea301487367;
    stim[45] = 51'h111723a927731;
    stim[46] = 51'h7c0ca1bde3f7c;
    stim[47] = 51'h0ae0fe290efe9;
    stim[48] = 51'h74d8ed3844cb3;
    stim[49] = 51'h1e35c7a707723;
    stim[50] = 51'h72eec8398d22a;
    stim[51] = 51'h5a2848d3898be;
    stim[52] = 51'h2d5ad3695bcb6;
    stim[53] = 51'h0e262349932f6;
    stim[54] = 51'h13976d6550970;
    stim[55] = 51'h6b3880c520a64;
    stim[56] = 51'h18aa8a62ebba6;
    stim[57] = 51'h43312d28beee0;
    stim[58] = 51'h101cde849ea22;
    stim[59] = 51'h276424d5bbb3a;
    stim[60] = 51'h051ce197bab73;
    stim[61] = 51'h0ada78d217ee1;
    stim[62] = 51'h2d5ae31f53c2b;
    stim[63] = 51'h38ff903f858a4;
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
