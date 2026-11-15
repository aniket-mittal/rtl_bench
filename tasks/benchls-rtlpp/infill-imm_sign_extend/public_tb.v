// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  imm_sign_extend dut (
    .raw_immediate(in_vec[15:0]),
    .extended_immediate(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hbbf4;
    stim[1] = 16'h2953;
    stim[2] = 16'h06f4;
    stim[3] = 16'haf06;
    stim[4] = 16'hb360;
    stim[5] = 16'h3175;
    stim[6] = 16'h1965;
    stim[7] = 16'hc2cb;
    stim[8] = 16'h6e32;
    stim[9] = 16'hc9ca;
    stim[10] = 16'h0a4a;
    stim[11] = 16'hbbe4;
    stim[12] = 16'h02f6;
    stim[13] = 16'hc230;
    stim[14] = 16'he656;
    stim[15] = 16'h5b23;
    stim[16] = 16'h686a;
    stim[17] = 16'hc89b;
    stim[18] = 16'h845e;
    stim[19] = 16'h257a;
    stim[20] = 16'hdae3;
    stim[21] = 16'hd182;
    stim[22] = 16'h15a3;
    stim[23] = 16'hbe03;
    stim[24] = 16'h3f68;
    stim[25] = 16'hc3f4;
    stim[26] = 16'h12e7;
    stim[27] = 16'h6e26;
    stim[28] = 16'h9ab3;
    stim[29] = 16'h8b03;
    stim[30] = 16'hb51d;
    stim[31] = 16'h1973;
    stim[32] = 16'h159f;
    stim[33] = 16'h4f98;
    stim[34] = 16'h54fe;
    stim[35] = 16'h44a3;
    stim[36] = 16'hf524;
    stim[37] = 16'hb92d;
    stim[38] = 16'h963d;
    stim[39] = 16'h9c04;
    stim[40] = 16'h9b51;
    stim[41] = 16'h8d77;
    stim[42] = 16'h773c;
    stim[43] = 16'h6532;
    stim[44] = 16'h571c;
    stim[45] = 16'h0203;
    stim[46] = 16'h6929;
    stim[47] = 16'h8f6b;
    stim[48] = 16'ha861;
    stim[49] = 16'hab0f;
    stim[50] = 16'hfbc2;
    stim[51] = 16'h1175;
    stim[52] = 16'heb71;
    stim[53] = 16'h57af;
    stim[54] = 16'h1769;
    stim[55] = 16'hcffd;
    stim[56] = 16'h5efd;
    stim[57] = 16'h7217;
    stim[58] = 16'hdeb1;
    stim[59] = 16'haa81;
    stim[60] = 16'h9a4d;
    stim[61] = 16'hb42f;
    stim[62] = 16'h1a12;
    stim[63] = 16'h31ce;
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
      expv[0] = 32'hffffbbf4;
      expv[1] = 32'h00002953;
      expv[2] = 32'h000006f4;
      expv[3] = 32'hffffaf06;
      expv[4] = 32'hffffb360;
      expv[5] = 32'h00003175;
      expv[6] = 32'h00001965;
      expv[7] = 32'hffffc2cb;
      expv[8] = 32'h00006e32;
      expv[9] = 32'hffffc9ca;
      expv[10] = 32'h00000a4a;
      expv[11] = 32'hffffbbe4;
      expv[12] = 32'h000002f6;
      expv[13] = 32'hffffc230;
      expv[14] = 32'hffffe656;
      expv[15] = 32'h00005b23;
      expv[16] = 32'h0000686a;
      expv[17] = 32'hffffc89b;
      expv[18] = 32'hffff845e;
      expv[19] = 32'h0000257a;
      expv[20] = 32'hffffdae3;
      expv[21] = 32'hffffd182;
      expv[22] = 32'h000015a3;
      expv[23] = 32'hffffbe03;
      expv[24] = 32'h00003f68;
      expv[25] = 32'hffffc3f4;
      expv[26] = 32'h000012e7;
      expv[27] = 32'h00006e26;
      expv[28] = 32'hffff9ab3;
      expv[29] = 32'hffff8b03;
      expv[30] = 32'hffffb51d;
      expv[31] = 32'h00001973;
      expv[32] = 32'h0000159f;
      expv[33] = 32'h00004f98;
      expv[34] = 32'h000054fe;
      expv[35] = 32'h000044a3;
      expv[36] = 32'hfffff524;
      expv[37] = 32'hffffb92d;
      expv[38] = 32'hffff963d;
      expv[39] = 32'hffff9c04;
      expv[40] = 32'hffff9b51;
      expv[41] = 32'hffff8d77;
      expv[42] = 32'h0000773c;
      expv[43] = 32'h00006532;
      expv[44] = 32'h0000571c;
      expv[45] = 32'h00000203;
      expv[46] = 32'h00006929;
      expv[47] = 32'hffff8f6b;
      expv[48] = 32'hffffa861;
      expv[49] = 32'hffffab0f;
      expv[50] = 32'hfffffbc2;
      expv[51] = 32'h00001175;
      expv[52] = 32'hffffeb71;
      expv[53] = 32'h000057af;
      expv[54] = 32'h00001769;
      expv[55] = 32'hffffcffd;
      expv[56] = 32'h00005efd;
      expv[57] = 32'h00007217;
      expv[58] = 32'hffffdeb1;
      expv[59] = 32'hffffaa81;
      expv[60] = 32'hffff9a4d;
      expv[61] = 32'hffffb42f;
      expv[62] = 32'h00001a12;
      expv[63] = 32'h000031ce;
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
