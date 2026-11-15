// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 75;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022479 dut (
    .clk(clk),
    .reset(in_vec[74:74]),
    .resetDebug(in_vec[73:73]),
    .enableDebug(in_vec[72:72]),
    .regWrite_in(in_vec[71:71]),
    .memToReg_in(in_vec[70:70]),
    .eop_in(in_vec[69:69]),
    .writeReg_in(in_vec[68:64]),
    .aluOut_in(in_vec[63:32]),
    .readData_in(in_vec[31:0]),
    .regWrite_out(out_vec[71:71]),
    .memToReg_out(out_vec[70:70]),
    .eop_out(out_vec[69:69]),
    .writeReg_out(out_vec[68:64]),
    .aluOut_out(out_vec[63:32]),
    .readData_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 75'h7c4643bee70df301d2c;
    stim[1] = 75'h6544962f494a488b8c5;
    stim[2] = 75'h16f73af0f40305c4d7c;
    stim[3] = 75'h0207baa6c528f0108c8;
    stim[4] = 75'h2a95c6bb482fdf36fa4;
    stim[5] = 75'h08846388aaf231af368;
    stim[6] = 75'h19761b2628d89e5cbaf;
    stim[7] = 75'h12efce499e5b436ce6f;
    stim[8] = 75'h082133bef6a6e62585c;
    stim[9] = 75'h381a8e7dc19b64c1029;
    stim[10] = 75'h644d3fb8d7dc425dff7;
    stim[11] = 75'h08df72f5a55424743fa;
    stim[12] = 75'h0d26085177380153dd7;
    stim[13] = 75'h127357b5e1d8ef710f5;
    stim[14] = 75'h3c395a700fdc4555290;
    stim[15] = 75'h3b02f3c2cec5b7d6c9a;
    stim[16] = 75'h37839d336ce9fcd60b4;
    stim[17] = 75'h3255279dc5f22440bc5;
    stim[18] = 75'h284010f43d8441e8ad5;
    stim[19] = 75'h1de4b7fa8ba48f9d01b;
    stim[20] = 75'h15989f53a9354dd6e01;
    stim[21] = 75'h336f15f4afaddacc4fd;
    stim[22] = 75'h28cdfe28038c74bde86;
    stim[23] = 75'h041e4a4762ce275806c;
    stim[24] = 75'h2a059c58f41359b14aa;
    stim[25] = 75'h22cdea029c7f95044e0;
    stim[26] = 75'h17278e89e958d3a24dd;
    stim[27] = 75'h35665a27f63e2e11eaf;
    stim[28] = 75'h205764b76b5c4c0a7d9;
    stim[29] = 75'h0001f10d974a3ab783c;
    stim[30] = 75'h36d30d9615748e8ba83;
    stim[31] = 75'h0553165928fd0643ca7;
    stim[32] = 75'h2aa3c634c5d8fcaebe4;
    stim[33] = 75'h3dd80c202f9dd4bce29;
    stim[34] = 75'h00db4a77539ef2c3f45;
    stim[35] = 75'h24c3e80093b1a54bbbb;
    stim[36] = 75'h02ec0749a3f5aa6648a;
    stim[37] = 75'h39bf94ef75d41980a5e;
    stim[38] = 75'h2ba612bb10ba1514516;
    stim[39] = 75'h248b51bd4f8f205f5f3;
    stim[40] = 75'h28b90603a4eb9097ffb;
    stim[41] = 75'h21bd0971552eb67a6a4;
    stim[42] = 75'h376d9e507105c27cf63;
    stim[43] = 75'h0c0755affce569f9e32;
    stim[44] = 75'h0cdf1c5fb8694c94407;
    stim[45] = 75'h0e07d4111222ee236c3;
    stim[46] = 75'h37aebda7539a8763e70;
    stim[47] = 75'h02b263d3fb03a3876ae;
    stim[48] = 75'h2a6f26c6ec1e3371944;
    stim[49] = 75'h0c6c0c44f76f8fceda3;
    stim[50] = 75'h01404f67f2bcda1669f;
    stim[51] = 75'h010a2b4a2e156dc28a8;
    stim[52] = 75'h1d631012ac1a40de4d1;
    stim[53] = 75'h1401943c16d5804665a;
    stim[54] = 75'h047a65a88e07f5ef972;
    stim[55] = 75'h3241953674ae3fb1f0f;
    stim[56] = 75'h1716e42fd3b22d21de5;
    stim[57] = 75'h30502a2ab5ca39c7b89;
    stim[58] = 75'h199d3fa49457c2585bf;
    stim[59] = 75'h3462e96631a77978942;
    stim[60] = 75'h31533aaa5db37bd2bbc;
    stim[61] = 75'h1f708e44d0204c2f095;
    stim[62] = 75'h3e065033a6c633379ed;
    stim[63] = 75'h3b73f11fb9c3bbea540;
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
      expv[0] = 72'h000000000000000000;
      expv[1] = 72'h000000000000000000;
      expv[2] = 72'h000000000000000000;
      expv[3] = 72'h6f73af0f40305c4d7c;
      expv[4] = 72'h6f73af0f40305c4d7c;
      expv[5] = 72'h000000000000000000;
      expv[6] = 72'h000000000000000000;
      expv[7] = 72'h9761b2628d89e5cbaf;
      expv[8] = 72'h2efce499e5b436ce6f;
      expv[9] = 72'h2efce499e5b436ce6f;
      expv[10] = 72'h000000000000000000;
      expv[11] = 72'h000000000000000000;
      expv[12] = 72'h000000000000000000;
      expv[13] = 72'h000000000000000000;
      expv[14] = 72'h27357b5e1d8ef710f5;
      expv[15] = 72'h000000000000000000;
      expv[16] = 72'h000000000000000000;
      expv[17] = 72'h000000000000000000;
      expv[18] = 72'h000000000000000000;
      expv[19] = 72'h000000000000000000;
      expv[20] = 72'hde4b7fa8ba48f9d01b;
      expv[21] = 72'h5989f53a9354dd6e01;
      expv[22] = 72'h000000000000000000;
      expv[23] = 72'h000000000000000000;
      expv[24] = 72'h000000000000000000;
      expv[25] = 72'h000000000000000000;
      expv[26] = 72'h000000000000000000;
      expv[27] = 72'h7278e89e958d3a24dd;
      expv[28] = 72'h000000000000000000;
      expv[29] = 72'h000000000000000000;
      expv[30] = 72'h000000000000000000;
      expv[31] = 72'h000000000000000000;
      expv[32] = 72'h000000000000000000;
      expv[33] = 72'h000000000000000000;
      expv[34] = 72'h000000000000000000;
      expv[35] = 72'h000000000000000000;
      expv[36] = 72'h000000000000000000;
      expv[37] = 72'h000000000000000000;
      expv[38] = 72'h000000000000000000;
      expv[39] = 72'h000000000000000000;
      expv[40] = 72'h000000000000000000;
      expv[41] = 72'h000000000000000000;
      expv[42] = 72'h000000000000000000;
      expv[43] = 72'h000000000000000000;
      expv[44] = 72'h000000000000000000;
      expv[45] = 72'h000000000000000000;
      expv[46] = 72'h000000000000000000;
      expv[47] = 72'h000000000000000000;
      expv[48] = 72'h000000000000000000;
      expv[49] = 72'h000000000000000000;
      expv[50] = 72'h000000000000000000;
      expv[51] = 72'h000000000000000000;
      expv[52] = 72'h000000000000000000;
      expv[53] = 72'hd631012ac1a40de4d1;
      expv[54] = 72'h401943c16d5804665a;
      expv[55] = 72'h401943c16d5804665a;
      expv[56] = 72'h000000000000000000;
      expv[57] = 72'h716e42fd3b22d21de5;
      expv[58] = 72'h000000000000000000;
      expv[59] = 72'h99d3fa49457c2585bf;
      expv[60] = 72'h000000000000000000;
      expv[61] = 72'h000000000000000000;
      expv[62] = 72'hf708e44d0204c2f095;
      expv[63] = 72'h000000000000000000;
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
