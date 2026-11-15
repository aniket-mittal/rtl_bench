// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145975 dut (
    .A(in_vec[39:24]),
    .B(in_vec[23:8]),
    .S(in_vec[7:4]),
    .BCD_input(in_vec[3:0]),
    .final_output(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h74e3f01631;
    stim[1] = 40'hae5b6e4b1a;
    stim[2] = 40'h7781d59577;
    stim[3] = 40'h6530140469;
    stim[4] = 40'hd8e7daccc2;
    stim[5] = 40'he3420755b0;
    stim[6] = 40'h060cc05b7b;
    stim[7] = 40'h48b96bc98e;
    stim[8] = 40'h0f958673d7;
    stim[9] = 40'h89d585ed80;
    stim[10] = 40'hd97151471a;
    stim[11] = 40'h5d28270bf2;
    stim[12] = 40'h456485739b;
    stim[13] = 40'h7285e433f5;
    stim[14] = 40'hfa8085a8d6;
    stim[15] = 40'h99705c8c23;
    stim[16] = 40'hdae312c3ed;
    stim[17] = 40'h292e962755;
    stim[18] = 40'hb04c3e8061;
    stim[19] = 40'h7655a5aa00;
    stim[20] = 40'heec42894d5;
    stim[21] = 40'ha1c19fa027;
    stim[22] = 40'hfe16f9906f;
    stim[23] = 40'h48dda2fd2b;
    stim[24] = 40'hc34d5f41c1;
    stim[25] = 40'h3c744e78e3;
    stim[26] = 40'hec69f7647d;
    stim[27] = 40'h24dff39bc8;
    stim[28] = 40'he59991efb1;
    stim[29] = 40'h71ab2b2c19;
    stim[30] = 40'h213635e007;
    stim[31] = 40'hb757ac13fb;
    stim[32] = 40'hf814093ffc;
    stim[33] = 40'h6fc725bc78;
    stim[34] = 40'h8b75be2a79;
    stim[35] = 40'h6ca69628a0;
    stim[36] = 40'hfe90f843fb;
    stim[37] = 40'h548ed543be;
    stim[38] = 40'h46ac58ed61;
    stim[39] = 40'hbd430e150a;
    stim[40] = 40'hcf544e27e6;
    stim[41] = 40'hd2d36d5357;
    stim[42] = 40'h539b42d58c;
    stim[43] = 40'hce8221f431;
    stim[44] = 40'h47d36747b6;
    stim[45] = 40'h04e12ac1f7;
    stim[46] = 40'h63776b7db0;
    stim[47] = 40'h43ede2e383;
    stim[48] = 40'h5ec3008bae;
    stim[49] = 40'hd42ea20895;
    stim[50] = 40'ha7e1202a75;
    stim[51] = 40'h8fa7d46d82;
    stim[52] = 40'hf385b0ffa9;
    stim[53] = 40'h6af0feea3a;
    stim[54] = 40'h286ac62955;
    stim[55] = 40'h86463032f5;
    stim[56] = 40'hd0e0da6821;
    stim[57] = 40'h930e1f1b37;
    stim[58] = 40'h5f75d09689;
    stim[59] = 40'h6c4ddf8959;
    stim[60] = 40'h3adc1a7f4d;
    stim[61] = 40'h1bed52f02a;
    stim[62] = 40'hb6dca47f70;
    stim[63] = 40'haa3088ca57;
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
      expv[0] = 8'h6f;
      expv[1] = 8'hd8;
      expv[2] = 8'h09;
      expv[3] = 8'hca;
      expv[4] = 8'h90;
      expv[5] = 8'h68;
      expv[6] = 8'h1a;
      expv[7] = 8'hbe;
      expv[8] = 8'h83;
      expv[9] = 8'hd5;
      expv[10] = 8'hed;
      expv[11] = 8'hbc;
      expv[12] = 8'hb4;
      expv[13] = 8'hea;
      expv[14] = 8'hda;
      expv[15] = 8'h29;
      expv[16] = 8'h6f;
      expv[17] = 8'h76;
      expv[18] = 8'h33;
      expv[19] = 8'h76;
      expv[20] = 8'h7b;
      expv[21] = 8'h6f;
      expv[22] = 8'h61;
      expv[23] = 8'h54;
      expv[24] = 8'h35;
      expv[25] = 8'hf4;
      expv[26] = 8'hd7;
      expv[27] = 8'h55;
      expv[28] = 8'hb4;
      expv[29] = 8'hc1;
      expv[30] = 8'h28;
      expv[31] = 8'h70;
      expv[32] = 8'hf3;
      expv[33] = 8'h96;
      expv[34] = 8'hf4;
      expv[35] = 8'h29;
      expv[36] = 8'hff;
      expv[37] = 8'h96;
      expv[38] = 8'hb2;
      expv[39] = 8'hbe;
      expv[40] = 8'h43;
      expv[41] = 8'ha5;
      expv[42] = 8'h9e;
      expv[43] = 8'h5a;
      expv[44] = 8'h00;
      expv[45] = 8'h10;
      expv[46] = 8'h6e;
      expv[47] = 8'hf0;
      expv[48] = 8'hb5;
      expv[49] = 8'h1c;
      expv[50] = 8'hc8;
      expv[51] = 8'ha9;
      expv[52] = 8'hea;
      expv[53] = 8'h0e;
      expv[54] = 8'h56;
      expv[55] = 8'h11;
      expv[56] = 8'h35;
      expv[57] = 8'hd9;
      expv[58] = 8'h7e;
      expv[59] = 8'h74;
      expv[60] = 8'hc7;
      expv[61] = 8'h47;
      expv[62] = 8'hb9;
      expv[63] = 8'h8c;
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
