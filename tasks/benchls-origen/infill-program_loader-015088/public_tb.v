// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 47;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015088 dut (
    .clkMem(clk),
    .progData(in_vec[56:49]),
    .progValid(in_vec[48:48]),
    .progEn(in_vec[47:47]),
    .addrIn(in_vec[46:37]),
    .dataIn(in_vec[36:5]),
    .weIn(in_vec[4:1]),
    .enIn(in_vec[0:0]),
    .addrOut(out_vec[46:37]),
    .dataOut(out_vec[36:5]),
    .weOut(out_vec[4:1]),
    .enOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h1f5cc01753ed34b;
    stim[1] = 57'h1ae06aaad061753;
    stim[2] = 57'h0702853dcfbe64f;
    stim[3] = 57'h06a5aac1ea69406;
    stim[4] = 57'h09ab4794ea91051;
    stim[5] = 57'h1e370ab10c5cbad;
    stim[6] = 57'h0d4d14ef82775ae;
    stim[7] = 57'h0dded21a36f298a;
    stim[8] = 57'h1dcdc7178f4a524;
    stim[9] = 57'h05912d97eab6acd;
    stim[10] = 57'h15e239374bfc821;
    stim[11] = 57'h11c54309db0b128;
    stim[12] = 57'h10f3b5acdfd9be6;
    stim[13] = 57'h0a29f18102cf317;
    stim[14] = 57'h1a1c44bf5ea5a8d;
    stim[15] = 57'h01cab3e937004dc;
    stim[16] = 57'h09c5046ee9bf383;
    stim[17] = 57'h19b4964ee01f3a3;
    stim[18] = 57'h03f29be13552740;
    stim[19] = 57'h0187ee7031b4282;
    stim[20] = 57'h18b959dec71b16e;
    stim[21] = 57'h0f7fef264368017;
    stim[22] = 57'h0dc805b73b2abf8;
    stim[23] = 57'h08f5400690555fc;
    stim[24] = 57'h076fd86e50d7cd8;
    stim[25] = 57'h10d6bcf88a92205;
    stim[26] = 57'h1cfd4be97d2acef;
    stim[27] = 57'h1e7e637d90c738f;
    stim[28] = 57'h006ddd111448f5e;
    stim[29] = 57'h0f8c1192cd90a60;
    stim[30] = 57'h1a5aeff37af2d7e;
    stim[31] = 57'h064497e254aafbe;
    stim[32] = 57'h19539f6bfe67afb;
    stim[33] = 57'h111f6f03f26791f;
    stim[34] = 57'h079af7b45d87bb9;
    stim[35] = 57'h0bca69a58f119fa;
    stim[36] = 57'h07e0901a45453cb;
    stim[37] = 57'h0ca803ccbe01d80;
    stim[38] = 57'h1a159ea0abc0373;
    stim[39] = 57'h13b9ac5fdbdad7b;
    stim[40] = 57'h09405e42dbc549b;
    stim[41] = 57'h003bd9f7b0dd257;
    stim[42] = 57'h1c3764c68a374aa;
    stim[43] = 57'h05dbffffe98256e;
    stim[44] = 57'h19483ecfb872981;
    stim[45] = 57'h0d121842d5b57af;
    stim[46] = 57'h078f8e40304957a;
    stim[47] = 57'h07a9e2b415af348;
    stim[48] = 57'h05cdc702811ae80;
    stim[49] = 57'h0416b68e9ac7c29;
    stim[50] = 57'h11b78e2e5056186;
    stim[51] = 57'h02bd354fae1e1f9;
    stim[52] = 57'h1302d8d326b6e29;
    stim[53] = 57'h1efe6ad26dd26e1;
    stim[54] = 57'h0937b0fefe76d3a;
    stim[55] = 57'h0971cffad10f696;
    stim[56] = 57'h161b9ed5ca88d3f;
    stim[57] = 57'h118d1bb775317ad;
    stim[58] = 57'h1427c7d176e52de;
    stim[59] = 57'h00be745d2f7bb0e;
    stim[60] = 57'h08c45177512d3bb;
    stim[61] = 57'h02bf30571ddb177;
    stim[62] = 57'h18f882ba28f917e;
    stim[63] = 57'h0ae17a204550f2c;
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
      expv[0] = 47'hxxxxxxxxxxxx;
      expv[1] = 47'hxxxxxxxxxxxx;
      expv[2] = 47'h06aaad061753;
      expv[3] = 47'h2853dcfbe64f;
      expv[4] = 47'h5aac1ea69406;
      expv[5] = 47'h7fe000000001;
      expv[6] = 47'h70ab10c5cbad;
      expv[7] = 47'h7fe000000001;
      expv[8] = 47'h7fe000000001;
      expv[9] = 47'h7fedc0000001;
      expv[10] = 47'h12d97eab6acd;
      expv[11] = 47'h239374bfc821;
      expv[12] = 47'h54309db0b128;
      expv[13] = 47'h3b5acdfd9be6;
      expv[14] = 47'h7fe000000001;
      expv[15] = 47'h7fe000000001;
      expv[16] = 47'h7ffa00000001;
      expv[17] = 47'h5046ee9bf383;
      expv[18] = 47'h4964ee01f3a3;
      expv[19] = 47'h29be13552740;
      expv[20] = 47'h7ee7031b4282;
      expv[21] = 47'h7fe000000001;
      expv[22] = 47'h7ff8a0000001;
      expv[23] = 47'h7fef78a00001;
      expv[24] = 47'h5400690555fc;
      expv[25] = 47'h7fe000000001;
      expv[26] = 47'h6bcf88a92205;
      expv[27] = 47'h7fe000000001;
      expv[28] = 47'h7ffce0000001;
      expv[29] = 47'h7ffe7ce00001;
      expv[30] = 47'h7ffe7ce00001;
      expv[31] = 47'h7ffe7ce00001;
      expv[32] = 47'h497e254aafbe;
      expv[33] = 47'h39f6bfe67afb;
      expv[34] = 47'h7fe000000001;
      expv[35] = 47'h7ff100000001;
      expv[36] = 47'h7fe791000001;
      expv[37] = 47'h0901a45453cb;
      expv[38] = 47'h7fe000000001;
      expv[39] = 47'h59ea0abc0373;
      expv[40] = 47'h7fe000000001;
      expv[41] = 47'h05e42dbc549b;
      expv[42] = 47'h7fe000000001;
      expv[43] = 47'h764c68a374aa;
      expv[44] = 47'h7fe000000001;
      expv[45] = 47'h7fe5c0000001;
      expv[46] = 47'h21842d5b57af;
      expv[47] = 47'h7fe000000001;
      expv[48] = 47'h7fe000000001;
      expv[49] = 47'h7fe000000001;
      expv[50] = 47'h6b68e9ac7c29;
      expv[51] = 47'h78e2e5056186;
      expv[52] = 47'h7fe000000001;
      expv[53] = 47'h2d8d326b6e29;
      expv[54] = 47'h7fe000000001;
      expv[55] = 47'h7b0fefe76d3a;
      expv[56] = 47'h1cffad10f696;
      expv[57] = 47'h7fe000000001;
      expv[58] = 47'h7ff600000001;
      expv[59] = 47'h7c7d176e52de;
      expv[60] = 47'h7fe000000001;
      expv[61] = 47'h45177512d3bb;
      expv[62] = 47'h7fe000000001;
      expv[63] = 47'h7fe2a0000001;
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
