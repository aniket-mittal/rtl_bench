// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_155923 dut (
    .aluCode(in_vec[67:64]),
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .result(out_vec[32:1]),
    .zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h5bf612e0f4f0b899b;
    stim[1] = 68'h89e4533dcceced458;
    stim[2] = 68'ha1a22e0858a95d4e2;
    stim[3] = 68'h34774f2cd987378cb;
    stim[4] = 68'h9b7c2030c37c1251d;
    stim[5] = 68'hc357db79a063def4d;
    stim[6] = 68'h25a0048c04518ca18;
    stim[7] = 68'hdfd96c75aced5bbfd;
    stim[8] = 68'h86c87ffc7e46cff84;
    stim[9] = 68'hbdcfe6e72dee3ea8d;
    stim[10] = 68'h9a9cf26392f8037d7;
    stim[11] = 68'ha9fd9b11126d90afd;
    stim[12] = 68'h58081b34271e7f56a;
    stim[13] = 68'h43402623d0f5533f2;
    stim[14] = 68'h6afeea0ce805147e2;
    stim[15] = 68'hb5090aad244ca74fa;
    stim[16] = 68'he05d8c442e88adc90;
    stim[17] = 68'h3438a4dc7e7556022;
    stim[18] = 68'h7c176745cddaa58fd;
    stim[19] = 68'hd25a94dff2be407d8;
    stim[20] = 68'hf5239b68f516feb09;
    stim[21] = 68'h3e6e4d4b67d96f99e;
    stim[22] = 68'h549a2bdbd61dac12a;
    stim[23] = 68'he3aebcefe2130ae83;
    stim[24] = 68'h11eab8e31b3341e89;
    stim[25] = 68'heb03e6d05108149a1;
    stim[26] = 68'he7d1106f3595c28a7;
    stim[27] = 68'hdaaba838f0d02c0d1;
    stim[28] = 68'h0287e4bcffd7a68f5;
    stim[29] = 68'h0fb11b094fb88c237;
    stim[30] = 68'h7908c2aa377d0df7a;
    stim[31] = 68'hf0db4ec1dab44f522;
    stim[32] = 68'h7796cf18a845b5b14;
    stim[33] = 68'hff3a7ec5867c8521f;
    stim[34] = 68'hb7bccbc591e0bcc23;
    stim[35] = 68'h9092717e24d7bf3d8;
    stim[36] = 68'he9358d60670db0388;
    stim[37] = 68'h21984f58330b84404;
    stim[38] = 68'h2e9c2d6580b01e345;
    stim[39] = 68'hcb35a9833d141bf1a;
    stim[40] = 68'h0f639cc91b149f01a;
    stim[41] = 68'h6c99dd70f1cfb9a2a;
    stim[42] = 68'h4f76c4d68ea2314e0;
    stim[43] = 68'h6849b5cc207d06ab3;
    stim[44] = 68'h4193355fdea203f84;
    stim[45] = 68'hb20f618829db52b74;
    stim[46] = 68'hd2530ac5e5d3c258c;
    stim[47] = 68'he1b441acbeeded9c8;
    stim[48] = 68'h5a4bad9075eadb1ed;
    stim[49] = 68'h26e4012309a35b17b;
    stim[50] = 68'h5d8eae46fc549106c;
    stim[51] = 68'h0c57cb6c34f5e983c;
    stim[52] = 68'he166bb7321145b5a7;
    stim[53] = 68'ha674b0841872b658f;
    stim[54] = 68'hebe0a2b08634054e8;
    stim[55] = 68'h0ccf7cb7b6cc4384f;
    stim[56] = 68'hc346141fe3c9e5231;
    stim[57] = 68'ha72abaa8e8900acea;
    stim[58] = 68'hbf435627693562e25;
    stim[59] = 68'hb43a1bae46f7470be;
    stim[60] = 68'h0fd1d19aa8f5ce150;
    stim[61] = 68'he099def563c696bff;
    stim[62] = 68'h5aaf83ddd018211cf;
    stim[63] = 68'h0fd96800520f67521;
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
      expv[0] = 33'h000000001;
      expv[1] = 33'h000000001;
      expv[2] = 33'h000000001;
      expv[3] = 33'h000e0e192;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000001;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000001;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000001;
      expv[13] = 33'h07eaee7fe;
      expv[14] = 33'h000000001;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000001;
      expv[17] = 33'h086008004;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h0c909a12c;
      expv[22] = 33'h000000001;
      expv[23] = 33'h000000001;
      expv[24] = 33'h0d6eedf50;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h04bf16988;
      expv[29] = 33'h1ed34e596;
      expv[30] = 33'h000000001;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000001;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000001;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000002;
      expv[38] = 33'h000000002;
      expv[39] = 33'h000000001;
      expv[40] = 33'h14f077956;
      expv[41] = 33'h000000001;
      expv[42] = 33'h1fedebbd0;
      expv[43] = 33'h000000001;
      expv[44] = 33'h1f666fffa;
      expv[45] = 33'h000000001;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000001;
      expv[49] = 33'h000000002;
      expv[50] = 33'h000000001;
      expv[51] = 33'h029b69dfe;
      expv[52] = 33'h000000001;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000001;
      expv[55] = 33'h073780794;
      expv[56] = 33'h000000001;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000001;
      expv[60] = 33'h118f3f5f4;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000001;
      expv[63] = 33'h03d19ea4c;
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
