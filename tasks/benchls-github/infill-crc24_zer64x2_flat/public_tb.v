// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  crc24_zer64x2_flat dut (
    .c(in_vec[23:0]),
    .crc_out(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h81b96c;
    stim[1] = 24'hf57916;
    stim[2] = 24'h6cc989;
    stim[3] = 24'h4b0894;
    stim[4] = 24'hf07978;
    stim[5] = 24'h2c0553;
    stim[6] = 24'h1729c1;
    stim[7] = 24'h872029;
    stim[8] = 24'h426434;
    stim[9] = 24'h643592;
    stim[10] = 24'he90cdc;
    stim[11] = 24'h8993f1;
    stim[12] = 24'h23c7ff;
    stim[13] = 24'hf8e513;
    stim[14] = 24'h59df30;
    stim[15] = 24'h1bd46a;
    stim[16] = 24'h656771;
    stim[17] = 24'h9c0f5d;
    stim[18] = 24'h9e0f08;
    stim[19] = 24'h07da2e;
    stim[20] = 24'h80c3eb;
    stim[21] = 24'hf2e959;
    stim[22] = 24'h54d8f0;
    stim[23] = 24'h756318;
    stim[24] = 24'h6324b6;
    stim[25] = 24'hbc1c04;
    stim[26] = 24'hed4128;
    stim[27] = 24'hc32bb4;
    stim[28] = 24'hd0fafc;
    stim[29] = 24'hbfe375;
    stim[30] = 24'hbcb419;
    stim[31] = 24'h603760;
    stim[32] = 24'h0f87b7;
    stim[33] = 24'h6f2bd6;
    stim[34] = 24'h103eac;
    stim[35] = 24'h5dc68c;
    stim[36] = 24'h212748;
    stim[37] = 24'h696295;
    stim[38] = 24'h2c7def;
    stim[39] = 24'h952f67;
    stim[40] = 24'h5d6a89;
    stim[41] = 24'h9af62c;
    stim[42] = 24'h487901;
    stim[43] = 24'h1d66d5;
    stim[44] = 24'h489603;
    stim[45] = 24'h25eeef;
    stim[46] = 24'hb8e261;
    stim[47] = 24'h42aa9f;
    stim[48] = 24'ha9ca99;
    stim[49] = 24'h8f7ec3;
    stim[50] = 24'h2539a5;
    stim[51] = 24'h7e462f;
    stim[52] = 24'h9ec50c;
    stim[53] = 24'h36ab9f;
    stim[54] = 24'h8e7491;
    stim[55] = 24'h37ccee;
    stim[56] = 24'he3ba95;
    stim[57] = 24'h9c5c72;
    stim[58] = 24'h015540;
    stim[59] = 24'hc75b4b;
    stim[60] = 24'hd0e8cb;
    stim[61] = 24'h720226;
    stim[62] = 24'h294b79;
    stim[63] = 24'h918f14;
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
      expv[0] = 24'h8eab8d;
      expv[1] = 24'h94c5f8;
      expv[2] = 24'h6cf222;
      expv[3] = 24'h866064;
      expv[4] = 24'h8ed01b;
      expv[5] = 24'h70e626;
      expv[6] = 24'hc4d4f2;
      expv[7] = 24'h67d099;
      expv[8] = 24'h2cf0f8;
      expv[9] = 24'hbff717;
      expv[10] = 24'h14b9a2;
      expv[11] = 24'h36282d;
      expv[12] = 24'h040f25;
      expv[13] = 24'h2600ff;
      expv[14] = 24'h22bd46;
      expv[15] = 24'h124985;
      expv[16] = 24'h6de47e;
      expv[17] = 24'h3e26fe;
      expv[18] = 24'hca0cc5;
      expv[19] = 24'h866e7e;
      expv[20] = 24'h14f3f8;
      expv[21] = 24'hac086b;
      expv[22] = 24'h93a8fa;
      expv[23] = 24'h089b37;
      expv[24] = 24'h5ab6e1;
      expv[25] = 24'h1b529f;
      expv[26] = 24'h16c7a5;
      expv[27] = 24'h672905;
      expv[28] = 24'h0371d3;
      expv[29] = 24'hde3bd1;
      expv[30] = 24'h552c7a;
      expv[31] = 24'h42e4a4;
      expv[32] = 24'h02aca4;
      expv[33] = 24'hb0b887;
      expv[34] = 24'h3319c7;
      expv[35] = 24'he5ca8f;
      expv[36] = 24'h9989e6;
      expv[37] = 24'h6ae353;
      expv[38] = 24'ha1c694;
      expv[39] = 24'h20ee2c;
      expv[40] = 24'hbcc471;
      expv[41] = 24'h1044b7;
      expv[42] = 24'h998b36;
      expv[43] = 24'hb5d11d;
      expv[44] = 24'h37b303;
      expv[45] = 24'hdd29d3;
      expv[46] = 24'h48b185;
      expv[47] = 24'hb0ac7f;
      expv[48] = 24'h83f46f;
      expv[49] = 24'h2751bd;
      expv[50] = 24'hdea8d1;
      expv[51] = 24'h4d26fd;
      expv[52] = 24'he4a358;
      expv[53] = 24'hcdc24f;
      expv[54] = 24'h4ef2fc;
      expv[55] = 24'h2ba064;
      expv[56] = 24'h6f9f8b;
      expv[57] = 24'hb7d8ca;
      expv[58] = 24'h6dc4af;
      expv[59] = 24'h01e194;
      expv[60] = 24'h8dead9;
      expv[61] = 24'h82acdd;
      expv[62] = 24'h602c23;
      expv[63] = 24'h73896c;
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
