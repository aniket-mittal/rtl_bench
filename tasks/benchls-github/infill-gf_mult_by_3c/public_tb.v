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

  gf_mult_by_3c dut (
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
    stim[0] = 8'h0a;
    stim[1] = 8'h2e;
    stim[2] = 8'hbf;
    stim[3] = 8'hd2;
    stim[4] = 8'h8c;
    stim[5] = 8'h71;
    stim[6] = 8'h37;
    stim[7] = 8'h2c;
    stim[8] = 8'he9;
    stim[9] = 8'hda;
    stim[10] = 8'h49;
    stim[11] = 8'hc7;
    stim[12] = 8'h0d;
    stim[13] = 8'hea;
    stim[14] = 8'hb9;
    stim[15] = 8'h9d;
    stim[16] = 8'hf5;
    stim[17] = 8'h32;
    stim[18] = 8'hbe;
    stim[19] = 8'h3f;
    stim[20] = 8'h92;
    stim[21] = 8'h61;
    stim[22] = 8'he4;
    stim[23] = 8'hef;
    stim[24] = 8'hae;
    stim[25] = 8'h9e;
    stim[26] = 8'h95;
    stim[27] = 8'hf5;
    stim[28] = 8'hea;
    stim[29] = 8'h8f;
    stim[30] = 8'he5;
    stim[31] = 8'h85;
    stim[32] = 8'h0c;
    stim[33] = 8'h3b;
    stim[34] = 8'haf;
    stim[35] = 8'hc1;
    stim[36] = 8'heb;
    stim[37] = 8'h1b;
    stim[38] = 8'hc3;
    stim[39] = 8'h94;
    stim[40] = 8'ha1;
    stim[41] = 8'h9d;
    stim[42] = 8'h77;
    stim[43] = 8'hf3;
    stim[44] = 8'h49;
    stim[45] = 8'h3c;
    stim[46] = 8'h1c;
    stim[47] = 8'h9a;
    stim[48] = 8'heb;
    stim[49] = 8'h8c;
    stim[50] = 8'he5;
    stim[51] = 8'hf5;
    stim[52] = 8'hc7;
    stim[53] = 8'h5a;
    stim[54] = 8'h5e;
    stim[55] = 8'hcb;
    stim[56] = 8'h29;
    stim[57] = 8'h7b;
    stim[58] = 8'h27;
    stim[59] = 8'hac;
    stim[60] = 8'h5e;
    stim[61] = 8'h79;
    stim[62] = 8'h0f;
    stim[63] = 8'h50;
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
      expv[0] = 8'h85;
      expv[1] = 8'ha6;
      expv[2] = 8'h16;
      expv[3] = 8'h4f;
      expv[4] = 8'h66;
      expv[5] = 8'hb3;
      expv[6] = 8'h80;
      expv[7] = 8'hde;
      expv[8] = 8'hc2;
      expv[9] = 8'hb2;
      expv[10] = 8'h7a;
      expv[11] = 8'h64;
      expv[12] = 8'h31;
      expv[13] = 8'h86;
      expv[14] = 8'h9e;
      expv[15] = 8'hbd;
      expv[16] = 8'h28;
      expv[17] = 8'h4c;
      expv[18] = 8'h2a;
      expv[19] = 8'h7d;
      expv[20] = 8'hf4;
      expv[21] = 8'h54;
      expv[22] = 8'hf3;
      expv[23] = 8'h4a;
      expv[24] = 8'hcd;
      expv[25] = 8'hf9;
      expv[26] = 8'h40;
      expv[27] = 8'h28;
      expv[28] = 8'h86;
      expv[29] = 8'h22;
      expv[30] = 8'hcf;
      expv[31] = 8'ha7;
      expv[32] = 8'h0d;
      expv[33] = 8'h8d;
      expv[34] = 8'hf1;
      expv[35] = 8'hec;
      expv[36] = 8'hba;
      expv[37] = 8'h5e;
      expv[38] = 8'h94;
      expv[39] = 8'h7c;
      expv[40] = 8'h84;
      expv[41] = 8'hbd;
      expv[42] = 8'h3b;
      expv[43] = 8'ha0;
      expv[44] = 8'h7a;
      expv[45] = 8'h39;
      expv[46] = 8'hea;
      expv[47] = 8'h09;
      expv[48] = 8'hba;
      expv[49] = 8'h66;
      expv[50] = 8'hcf;
      expv[51] = 8'h28;
      expv[52] = 8'h64;
      expv[53] = 8'hd9;
      expv[54] = 8'h29;
      expv[55] = 8'h69;
      expv[56] = 8'h12;
      expv[57] = 8'h36;
      expv[58] = 8'h67;
      expv[59] = 8'hb5;
      expv[60] = 8'h29;
      expv[61] = 8'h4e;
      expv[62] = 8'h49;
      expv[63] = 8'h5c;
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
