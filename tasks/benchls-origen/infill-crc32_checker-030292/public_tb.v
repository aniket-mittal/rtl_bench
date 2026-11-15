// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_030292 dut (
    .CLK(clk),
    .RESET_N(in_vec[66:66]),
    .PKT_CRC_VALID_IN(in_vec[65:65]),
    .PKT_CRC_CHECKSUM_IN(in_vec[64:33]),
    .CRC_GEN_VALID_IN(in_vec[32:32]),
    .CRC_GEN_CHECKSUM_IN(in_vec[31:0]),
    .CRC_CHK_VALID_OUT(out_vec[1:1]),
    .CRC_CHK_BAD_STATUS_OUT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h1e50979de3a56408e;
    stim[1] = 67'h1f68d34794f32ac7b;
    stim[2] = 67'h430c76969732481a1;
    stim[3] = 67'h40e8f8fe215282a39;
    stim[4] = 67'h733eecd23d4574b6c;
    stim[5] = 67'h6e1dc4d7ff566310d;
    stim[6] = 67'h0bc253e2435eb11cc;
    stim[7] = 67'h67d3bef8ccc72bbe4;
    stim[8] = 67'h730dfab0a4060950f;
    stim[9] = 67'h629894fca5f29561b;
    stim[10] = 67'h6b79b9c4d152f764c;
    stim[11] = 67'h7599068e4970948b9;
    stim[12] = 67'h6b3174b7ddc7c41c6;
    stim[13] = 67'h6a5241f1adf24fae6;
    stim[14] = 67'h54a6212b3fe6f49ed;
    stim[15] = 67'h72bebd8ba73a5cb26;
    stim[16] = 67'h496caa209013533f0;
    stim[17] = 67'h739030f49a78e082b;
    stim[18] = 67'h5522eb1f673294a49;
    stim[19] = 67'h0418a791ea2120620;
    stim[20] = 67'h60637b7eb635339db;
    stim[21] = 67'h6e3dab7e6e8bfa851;
    stim[22] = 67'h76d5a68fca84d49ea;
    stim[23] = 67'h442a2f41cde366d4a;
    stim[24] = 67'h42d98df7566b6b2ff;
    stim[25] = 67'h4f2c259b8c9999976;
    stim[26] = 67'h761f12fab84e094a9;
    stim[27] = 67'h5b3f9c3e5c9ea20ef;
    stim[28] = 67'h56d41d3d7c98fcc20;
    stim[29] = 67'h73e40ee4247e5c35a;
    stim[30] = 67'h5a24e2c2bc35a7c14;
    stim[31] = 67'h4d49f2c1fc0e5550b;
    stim[32] = 67'h4475ce09a20d70b99;
    stim[33] = 67'h7df859e27ade44ee2;
    stim[34] = 67'h46ad2ec4b5275367e;
    stim[35] = 67'h50d6ca7dc8fd5073b;
    stim[36] = 67'h7f53791f5781cec92;
    stim[37] = 67'h4f84092f4e403e8eb;
    stim[38] = 67'h5f8b09b36bf4a6d15;
    stim[39] = 67'h6370c2d2e9c62abb0;
    stim[40] = 67'h7a2f87f65e0feef9c;
    stim[41] = 67'h4e8010e84ca204ab7;
    stim[42] = 67'h71c30ff78ea178eb6;
    stim[43] = 67'h718212ed7c6246c17;
    stim[44] = 67'h763c9264f54f08f3f;
    stim[45] = 67'h41b227ba4be618c0c;
    stim[46] = 67'h6f7397d776ec778fc;
    stim[47] = 67'h7669e513bd72942e9;
    stim[48] = 67'h7e74a62ff52a164c7;
    stim[49] = 67'h531f1981b19a1dda4;
    stim[50] = 67'h7d95bc1be57e4686a;
    stim[51] = 67'h472979924f64dfe1c;
    stim[52] = 67'h7eec738ad281066a2;
    stim[53] = 67'h76698736635584e05;
    stim[54] = 67'h62a9aa5e9dc8094ae;
    stim[55] = 67'h645a008e884371993;
    stim[56] = 67'h7b0bb8614901494a2;
    stim[57] = 67'h59bf950ce64173837;
    stim[58] = 67'h6e402cd5fe0aba92a;
    stim[59] = 67'h71807940f9d11bece;
    stim[60] = 67'h74d750590968dda36;
    stim[61] = 67'h5366a4228bc9c878b;
    stim[62] = 67'h650f845ecbf19dfd6;
    stim[63] = 67'h54cb115e7904bbdbf;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h3;
      expv[13] = 2'h1;
      expv[14] = 2'h3;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h3;
      expv[18] = 2'h1;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h3;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h3;
      expv[27] = 2'h1;
      expv[28] = 2'h3;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h3;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h3;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h3;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h3;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h3;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h3;
      expv[49] = 2'h1;
      expv[50] = 2'h3;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h3;
      expv[55] = 2'h1;
      expv[56] = 2'h3;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h3;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
