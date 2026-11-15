// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 84;
  localparam OW = 82;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005580 dut (
    .clk(clk),
    .rst(in_vec[83:83]),
    .enable(in_vec[82:82]),
    .i_Mem(in_vec[81:73]),
    .i_WB(in_vec[72:71]),
    .i_pc(in_vec[70:39]),
    .i_Rdst(in_vec[38:36]),
    .i_alu(in_vec[35:20]),
    .i_read_data1(in_vec[19:4]),
    .i_flag(in_vec[3:0]),
    .o_WB(out_vec[81:80]),
    .o_Mem(out_vec[79:71]),
    .o_pc(out_vec[70:39]),
    .o_Rdst(out_vec[38:36]),
    .o_alu(out_vec[35:20]),
    .o_read_data1(out_vec[19:4]),
    .o_flag(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 84'hbe29f367868b29017fc26;
    stim[1] = 84'h8997ad4655518aef3326e;
    stim[2] = 84'h42b7efc82baa13accca77;
    stim[3] = 84'h3d4d419d04692de9f7c61;
    stim[4] = 84'h3c8c723e53a3cdb184425;
    stim[5] = 84'h1af4818a4f402cb1100ae;
    stim[6] = 84'h02f0f5b7b759c31e3c1df;
    stim[7] = 84'h03dace8cf2306e26c35c0;
    stim[8] = 84'h0e4b646ea0439a0cb2797;
    stim[9] = 84'h594806375f925c637dfae;
    stim[10] = 84'h27d61bc27518ccf601972;
    stim[11] = 84'h6a8ff3822f7571dcfeb2f;
    stim[12] = 84'h1ad2bfa8701bac2ea6008;
    stim[13] = 84'h1fbdbfc289e675c5f5f7c;
    stim[14] = 84'h67aa0d404787cfd58628c;
    stim[15] = 84'h39d3cc76959b6587b2c54;
    stim[16] = 84'h30a5cc58aa0b15e3c1b08;
    stim[17] = 84'h14fece4277c0157eb0dd7;
    stim[18] = 84'h5b1956094d031fae77028;
    stim[19] = 84'h0dc269182d15124cbf899;
    stim[20] = 84'h1895160e5ab6d3a22d1a6;
    stim[21] = 84'h050b14efaeb1dae6a7554;
    stim[22] = 84'h235c1e8587e1c4b26bfc2;
    stim[23] = 84'h5a1d70c6e994fd5e25687;
    stim[24] = 84'h3ecdc5b76c966d634a1d6;
    stim[25] = 84'h2ce21cc4125662b2c99e9;
    stim[26] = 84'h2aaf4ceb8f6f10ba27d7f;
    stim[27] = 84'h1ef6d19ef7c5b6c933d12;
    stim[28] = 84'h3cb895eeed43daf4b2d3b;
    stim[29] = 84'h3f6071944d68172a0141e;
    stim[30] = 84'h2508a5f7fdc71d571242f;
    stim[31] = 84'h641063e74df909167630d;
    stim[32] = 84'h61b5ed86c1ad1b0091d18;
    stim[33] = 84'h49b7bbc22af2221f4e902;
    stim[34] = 84'h205b4e81195e438eefd75;
    stim[35] = 84'h092b61bc26570316830b4;
    stim[36] = 84'h333e3dad7689946011fc9;
    stim[37] = 84'h315c87ee01dacfd0194a2;
    stim[38] = 84'h7359bde72723346687a4a;
    stim[39] = 84'h3731fd4febb1e1028dcb2;
    stim[40] = 84'h469e364b76eb537b7cbc7;
    stim[41] = 84'h67e2ad6743b1d0bdda54e;
    stim[42] = 84'h3448b4a730120363d2ab9;
    stim[43] = 84'h0826d68f7c74d1b609742;
    stim[44] = 84'h54896ac5b68fc08f9f4de;
    stim[45] = 84'h540b09334270358511900;
    stim[46] = 84'h2163b088b41276f6d570b;
    stim[47] = 84'h02cb04e6a3a2fbd860660;
    stim[48] = 84'h16ee6cd631143012dcb0e;
    stim[49] = 84'h63f21bde20ee4bf6c885f;
    stim[50] = 84'h2cbae8d1fb873cd684436;
    stim[51] = 84'h2c6d2d8c2a44db6d3e871;
    stim[52] = 84'h184cfa7015a0bcdc3b24d;
    stim[53] = 84'h56a9568f8d89906e86eae;
    stim[54] = 84'h71cfac9a35be580b42989;
    stim[55] = 84'h3463721c28457463398c8;
    stim[56] = 84'h0b9ea5d353b6d02fd7eac;
    stim[57] = 84'h17b558fe88966239a1e09;
    stim[58] = 84'h163ea9378394b1255c29a;
    stim[59] = 84'h50e03ad0170e7ec285e54;
    stim[60] = 84'haa15ad788bae75dcb8abf;
    stim[61] = 84'h45fddfd27ae8474473e8b;
    stim[62] = 84'h0b738aa5e44892a98fed9;
    stim[63] = 84'h7b2cc0738d326e47d6cb0;
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
      expv[0] = 82'hxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 82'h000000000000000000000;
      expv[2] = 82'h000000000000000000000;
      expv[3] = 82'h20afefc82baa13accca77;
      expv[4] = 82'h20afefc82baa13accca77;
      expv[5] = 82'h20afefc82baa13accca77;
      expv[6] = 82'h20afefc82baa13accca77;
      expv[7] = 82'h20afefc82baa13accca77;
      expv[8] = 82'h20afefc82baa13accca77;
      expv[9] = 82'h20afefc82baa13accca77;
      expv[10] = 82'h165006375f925c637dfae;
      expv[11] = 82'h165006375f925c637dfae;
      expv[12] = 82'h1aa7f3822f7571dcfeb2f;
      expv[13] = 82'h1aa7f3822f7571dcfeb2f;
      expv[14] = 82'h1aa7f3822f7571dcfeb2f;
      expv[15] = 82'h19ea0d404787cfd58628c;
      expv[16] = 82'h19ea0d404787cfd58628c;
      expv[17] = 82'h19ea0d404787cfd58628c;
      expv[18] = 82'h19ea0d404787cfd58628c;
      expv[19] = 82'h36c156094d031fae77028;
      expv[20] = 82'h36c156094d031fae77028;
      expv[21] = 82'h36c156094d031fae77028;
      expv[22] = 82'h36c156094d031fae77028;
      expv[23] = 82'h36c156094d031fae77028;
      expv[24] = 82'h368570c6e994fd5e25687;
      expv[25] = 82'h368570c6e994fd5e25687;
      expv[26] = 82'h368570c6e994fd5e25687;
      expv[27] = 82'h368570c6e994fd5e25687;
      expv[28] = 82'h368570c6e994fd5e25687;
      expv[29] = 82'h368570c6e994fd5e25687;
      expv[30] = 82'h368570c6e994fd5e25687;
      expv[31] = 82'h368570c6e994fd5e25687;
      expv[32] = 82'h290063e74df909167630d;
      expv[33] = 82'h286ded86c1ad1b0091d18;
      expv[34] = 82'h226fbbc22af2221f4e902;
      expv[35] = 82'h226fbbc22af2221f4e902;
      expv[36] = 82'h226fbbc22af2221f4e902;
      expv[37] = 82'h226fbbc22af2221f4e902;
      expv[38] = 82'h226fbbc22af2221f4e902;
      expv[39] = 82'h3cd1bde72723346687a4a;
      expv[40] = 82'h3cd1bde72723346687a4a;
      expv[41] = 82'h31a6364b76eb537b7cbc7;
      expv[42] = 82'h09faad6743b1d0bdda54e;
      expv[43] = 82'h09faad6743b1d0bdda54e;
      expv[44] = 82'h09faad6743b1d0bdda54e;
      expv[45] = 82'h15216ac5b68fc08f9f4de;
      expv[46] = 82'h150309334270358511900;
      expv[47] = 82'h150309334270358511900;
      expv[48] = 82'h150309334270358511900;
      expv[49] = 82'h150309334270358511900;
      expv[50] = 82'h28fa1bde20ee4bf6c885f;
      expv[51] = 82'h28fa1bde20ee4bf6c885f;
      expv[52] = 82'h28fa1bde20ee4bf6c885f;
      expv[53] = 82'h28fa1bde20ee4bf6c885f;
      expv[54] = 82'h15a9568f8d89906e86eae;
      expv[55] = 82'h1c77ac9a35be580b42989;
      expv[56] = 82'h1c77ac9a35be580b42989;
      expv[57] = 82'h1c77ac9a35be580b42989;
      expv[58] = 82'h1c77ac9a35be580b42989;
      expv[59] = 82'h1c77ac9a35be580b42989;
      expv[60] = 82'h04383ad0170e7ec285e54;
      expv[61] = 82'h000000000000000000000;
      expv[62] = 82'h317ddfd27ae8474473e8b;
      expv[63] = 82'h317ddfd27ae8474473e8b;
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
