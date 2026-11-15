// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03081 dut (
    .so1x(in_vec[31:28]),
    .so2x(in_vec[27:24]),
    .so3x(in_vec[23:20]),
    .so4x(in_vec[19:16]),
    .so5x(in_vec[15:12]),
    .so6x(in_vec[11:8]),
    .so7x(in_vec[7:4]),
    .so8x(in_vec[3:0]),
    .ppo(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h854b246e;
    stim[1] = 32'hdb822fe8;
    stim[2] = 32'h294a3712;
    stim[3] = 32'h9dc5768a;
    stim[4] = 32'hcd4673e8;
    stim[5] = 32'h1169edfa;
    stim[6] = 32'hfdf0fbd0;
    stim[7] = 32'he075be42;
    stim[8] = 32'h5abbc0d3;
    stim[9] = 32'h421bb797;
    stim[10] = 32'ha76fc4c0;
    stim[11] = 32'hb023be59;
    stim[12] = 32'h03bdff95;
    stim[13] = 32'h01339e00;
    stim[14] = 32'h8d465aed;
    stim[15] = 32'h67c027bc;
    stim[16] = 32'h1ac3c522;
    stim[17] = 32'h87ec34e8;
    stim[18] = 32'h0dcbeb0f;
    stim[19] = 32'hee706a66;
    stim[20] = 32'h2e94392a;
    stim[21] = 32'h7b39d707;
    stim[22] = 32'hc33c99a0;
    stim[23] = 32'h92fdbf78;
    stim[24] = 32'h98ce5e7b;
    stim[25] = 32'h80825bc9;
    stim[26] = 32'h5f5efdaf;
    stim[27] = 32'h34ded095;
    stim[28] = 32'h0653d73f;
    stim[29] = 32'h6d40518b;
    stim[30] = 32'h81478806;
    stim[31] = 32'h3baea553;
    stim[32] = 32'h06346d92;
    stim[33] = 32'h0007e4fe;
    stim[34] = 32'h9f8be8a9;
    stim[35] = 32'hc42f96aa;
    stim[36] = 32'h2cfc639d;
    stim[37] = 32'ha9a17246;
    stim[38] = 32'h3cd557cd;
    stim[39] = 32'hf1d379a9;
    stim[40] = 32'hffb78343;
    stim[41] = 32'he2634297;
    stim[42] = 32'he6276cb4;
    stim[43] = 32'hb8dbd79e;
    stim[44] = 32'h93d55656;
    stim[45] = 32'hfc07c919;
    stim[46] = 32'h57852516;
    stim[47] = 32'ha6f83d7e;
    stim[48] = 32'h9c9b35dd;
    stim[49] = 32'hf28393d5;
    stim[50] = 32'haa357706;
    stim[51] = 32'h438f49eb;
    stim[52] = 32'ha226a26c;
    stim[53] = 32'h39359776;
    stim[54] = 32'h0c6c7b7b;
    stim[55] = 32'hd6d90ecc;
    stim[56] = 32'h23825431;
    stim[57] = 32'h749f3e27;
    stim[58] = 32'h56409df4;
    stim[59] = 32'hb852fe8d;
    stim[60] = 32'h5ce3b890;
    stim[61] = 32'h7e2c403a;
    stim[62] = 32'hfeede532;
    stim[63] = 32'h51837a26;
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
      expv[0] = 32'h88d344f8;
      expv[1] = 32'h58f8e58b;
      expv[2] = 32'h226b62c8;
      expv[3] = 32'ha8af519b;
      expv[4] = 32'h28fdf491;
      expv[5] = 32'h9b1764cf;
      expv[6] = 32'h37bde397;
      expv[7] = 32'hb5b3928c;
      expv[8] = 32'hc75e8947;
      expv[9] = 32'he762a8e9;
      expv[10] = 32'hc1d5525d;
      expv[11] = 32'hbbf00a8e;
      expv[12] = 32'hf72479ed;
      expv[13] = 32'hb560400c;
      expv[14] = 32'h38fd5c31;
      expv[15] = 32'h4a21e7b9;
      expv[16] = 32'hc14f250a;
      expv[17] = 32'h689155dd;
      expv[18] = 32'h996f69f0;
      expv[19] = 32'h54bf86b4;
      expv[20] = 32'h7c0a3790;
      expv[21] = 32'he52eea6e;
      expv[22] = 32'h7580f445;
      expv[23] = 32'hffb135ce;
      expv[24] = 32'h3aff1d4a;
      expv[25] = 32'h38f42901;
      expv[26] = 32'h7d4ffcfb;
      expv[27] = 32'h27451b73;
      expv[28] = 32'hef672c38;
      expv[29] = 32'h280fea11;
      expv[30] = 32'h91c35020;
      expv[31] = 32'h435a7bce;
      expv[32] = 32'h5606309d;
      expv[33] = 32'h8b5614a9;
      expv[34] = 32'hd9cc4dd3;
      expv[35] = 32'ha9e2945d;
      expv[36] = 32'h0e2d3bf5;
      expv[37] = 32'ha0be43a4;
      expv[38] = 32'hac3d3b3b;
      expv[39] = 32'hbcc5ef83;
      expv[40] = 32'hc5fafb16;
      expv[41] = 32'hc2e78a25;
      expv[42] = 32'hd2c496bd;
      expv[43] = 32'hafef236b;
      expv[44] = 32'he6b7512a;
      expv[45] = 32'h9bccba12;
      expv[46] = 32'hc202f1ba;
      expv[47] = 32'h7e9327fc;
      expv[48] = 32'haed829fb;
      expv[49] = 32'he3f0ab23;
      expv[50] = 32'he4ae32ac;
      expv[51] = 32'hd856fd41;
      expv[52] = 32'h49f016a4;
      expv[53] = 32'ha73a762e;
      expv[54] = 32'h3a3f3cd4;
      expv[55] = 32'hdcb1817b;
      expv[56] = 32'h62444f08;
      expv[57] = 32'hb4629ffa;
      expv[58] = 32'h7311a43b;
      expv[59] = 32'h3ded0aab;
      expv[60] = 32'hb3498197;
      expv[61] = 32'h4a0e9656;
      expv[62] = 32'hc38fb7de;
      expv[63] = 32'hb066c5a2;
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
