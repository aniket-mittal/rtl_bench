// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_fe dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h25;
    stim[1] = 8'h8e;
    stim[2] = 8'h89;
    stim[3] = 8'h52;
    stim[4] = 8'h1b;
    stim[5] = 8'h4e;
    stim[6] = 8'h64;
    stim[7] = 8'h44;
    stim[8] = 8'hfb;
    stim[9] = 8'h0b;
    stim[10] = 8'h5e;
    stim[11] = 8'h55;
    stim[12] = 8'h9d;
    stim[13] = 8'hb6;
    stim[14] = 8'h85;
    stim[15] = 8'h22;
    stim[16] = 8'hea;
    stim[17] = 8'h26;
    stim[18] = 8'h48;
    stim[19] = 8'h25;
    stim[20] = 8'h33;
    stim[21] = 8'he7;
    stim[22] = 8'ha1;
    stim[23] = 8'h30;
    stim[24] = 8'hf7;
    stim[25] = 8'h0e;
    stim[26] = 8'h0d;
    stim[27] = 8'ha0;
    stim[28] = 8'hce;
    stim[29] = 8'hef;
    stim[30] = 8'h6e;
    stim[31] = 8'h7c;
    stim[32] = 8'had;
    stim[33] = 8'h53;
    stim[34] = 8'h6c;
    stim[35] = 8'h6a;
    stim[36] = 8'hbb;
    stim[37] = 8'h02;
    stim[38] = 8'h6c;
    stim[39] = 8'h87;
    stim[40] = 8'hce;
    stim[41] = 8'h7b;
    stim[42] = 8'h39;
    stim[43] = 8'h72;
    stim[44] = 8'h62;
    stim[45] = 8'h0c;
    stim[46] = 8'h0a;
    stim[47] = 8'h49;
    stim[48] = 8'hde;
    stim[49] = 8'hfb;
    stim[50] = 8'hb9;
    stim[51] = 8'h31;
    stim[52] = 8'h97;
    stim[53] = 8'h6e;
    stim[54] = 8'h32;
    stim[55] = 8'h32;
    stim[56] = 8'h25;
    stim[57] = 8'hbb;
    stim[58] = 8'hc6;
    stim[59] = 8'h44;
    stim[60] = 8'he9;
    stim[61] = 8'h4a;
    stim[62] = 8'he2;
    stim[63] = 8'hcb;
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
      expv[0] = 8'h97;
      expv[1] = 8'h7f;
      expv[2] = 8'hbf;
      expv[3] = 8'hcb;
      expv[4] = 8'he7;
      expv[5] = 8'hec;
      expv[6] = 8'h18;
      expv[7] = 8'hae;
      expv[8] = 8'hc2;
      expv[9] = 8'hbc;
      expv[10] = 8'hb7;
      expv[11] = 8'h0b;
      expv[12] = 8'h3b;
      expv[13] = 8'h31;
      expv[14] = 8'hc3;
      expv[15] = 8'h57;
      expv[16] = 8'h67;
      expv[17] = 8'h88;
      expv[18] = 8'hd2;
      expv[19] = 8'h97;
      expv[20] = 8'hf2;
      expv[21] = 8'he5;
      expv[22] = 8'haa;
      expv[23] = 8'hed;
      expv[24] = 8'hbe;
      expv[25] = 8'h9d;
      expv[26] = 8'h82;
      expv[27] = 8'h54;
      expv[28] = 8'h0e;
      expv[29] = 8'h46;
      expv[30] = 8'h5a;
      expv[31] = 8'he0;
      expv[32] = 8'hd6;
      expv[33] = 8'h35;
      expv[34] = 8'hbb;
      expv[35] = 8'h85;
      expv[36] = 8'hb3;
      expv[37] = 8'he1;
      expv[38] = 8'hbb;
      expv[39] = 8'h22;
      expv[40] = 8'h0e;
      expv[41] = 8'h20;
      expv[42] = 8'hb0;
      expv[43] = 8'h7d;
      expv[44] = 8'h26;
      expv[45] = 8'h7c;
      expv[46] = 8'h42;
      expv[47] = 8'h2c;
      expv[48] = 8'h55;
      expv[49] = 8'hc2;
      expv[50] = 8'h52;
      expv[51] = 8'h13;
      expv[52] = 8'h79;
      expv[53] = 8'h5a;
      expv[54] = 8'h0c;
      expv[55] = 8'h0c;
      expv[56] = 8'h97;
      expv[57] = 8'hb3;
      expv[58] = 8'had;
      expv[59] = 8'hae;
      expv[60] = 8'h78;
      expv[61] = 8'h33;
      expv[62] = 8'hc4;
      expv[63] = 8'h2f;
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
