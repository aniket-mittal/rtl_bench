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

  gf_mult_by_bf dut (
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
    stim[0] = 8'ha8;
    stim[1] = 8'ha8;
    stim[2] = 8'hc6;
    stim[3] = 8'h67;
    stim[4] = 8'hdd;
    stim[5] = 8'h1b;
    stim[6] = 8'h1b;
    stim[7] = 8'h94;
    stim[8] = 8'he4;
    stim[9] = 8'ha7;
    stim[10] = 8'hab;
    stim[11] = 8'h99;
    stim[12] = 8'hcb;
    stim[13] = 8'hf4;
    stim[14] = 8'h5c;
    stim[15] = 8'h45;
    stim[16] = 8'he1;
    stim[17] = 8'h7d;
    stim[18] = 8'hc2;
    stim[19] = 8'haa;
    stim[20] = 8'hb3;
    stim[21] = 8'h3c;
    stim[22] = 8'h0b;
    stim[23] = 8'h30;
    stim[24] = 8'h20;
    stim[25] = 8'h6d;
    stim[26] = 8'h68;
    stim[27] = 8'h12;
    stim[28] = 8'h68;
    stim[29] = 8'h90;
    stim[30] = 8'ha3;
    stim[31] = 8'h22;
    stim[32] = 8'h13;
    stim[33] = 8'hb4;
    stim[34] = 8'h2f;
    stim[35] = 8'hbc;
    stim[36] = 8'hcf;
    stim[37] = 8'h2c;
    stim[38] = 8'ha4;
    stim[39] = 8'hd4;
    stim[40] = 8'he2;
    stim[41] = 8'hbe;
    stim[42] = 8'hcd;
    stim[43] = 8'hb0;
    stim[44] = 8'h86;
    stim[45] = 8'h48;
    stim[46] = 8'he1;
    stim[47] = 8'h6c;
    stim[48] = 8'h31;
    stim[49] = 8'hd0;
    stim[50] = 8'haf;
    stim[51] = 8'h99;
    stim[52] = 8'hba;
    stim[53] = 8'he7;
    stim[54] = 8'h90;
    stim[55] = 8'h7d;
    stim[56] = 8'h5a;
    stim[57] = 8'ha1;
    stim[58] = 8'hb7;
    stim[59] = 8'h38;
    stim[60] = 8'hdb;
    stim[61] = 8'h1a;
    stim[62] = 8'h72;
    stim[63] = 8'h5a;
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
      expv[0] = 8'h0a;
      expv[1] = 8'h0a;
      expv[2] = 8'hbc;
      expv[3] = 8'h98;
      expv[4] = 8'hce;
      expv[5] = 8'h72;
      expv[6] = 8'h72;
      expv[7] = 8'h1c;
      expv[8] = 8'ha1;
      expv[9] = 8'h81;
      expv[10] = 8'hd6;
      expv[11] = 8'hf4;
      expv[12] = 8'h54;
      expv[13] = 8'h9e;
      expv[14] = 8'h94;
      expv[15] = 8'h85;
      expv[16] = 8'hd8;
      expv[17] = 8'h55;
      expv[18] = 8'h7a;
      expv[19] = 8'h69;
      expv[20] = 8'h78;
      expv[21] = 8'h16;
      expv[22] = 8'h4d;
      expv[23] = 8'h41;
      expv[24] = 8'h7e;
      expv[25] = 8'h6a;
      expv[26] = 8'h13;
      expv[27] = 8'h5c;
      expv[28] = 8'h13;
      expv[29] = 8'hda;
      expv[30] = 8'h47;
      expv[31] = 8'h1d;
      expv[32] = 8'he3;
      expv[33] = 8'h62;
      expv[34] = 8'hf5;
      expv[35] = 8'hf3;
      expv[36] = 8'h92;
      expv[37] = 8'h29;
      expv[38] = 8'h5d;
      expv[39] = 8'he0;
      expv[40] = 8'h04;
      expv[41] = 8'h90;
      expv[42] = 8'hf1;
      expv[43] = 8'ha4;
      expv[44] = 8'h40;
      expv[45] = 8'h6d;
      expv[46] = 8'hd8;
      expv[47] = 8'hd5;
      expv[48] = 8'hfe;
      expv[49] = 8'h26;
      expv[50] = 8'h10;
      expv[51] = 8'hf4;
      expv[52] = 8'h56;
      expv[53] = 8'h7d;
      expv[54] = 8'hda;
      expv[55] = 8'h55;
      expv[56] = 8'h31;
      expv[57] = 8'h24;
      expv[58] = 8'hbe;
      expv[59] = 8'hd0;
      expv[60] = 8'h6b;
      expv[61] = 8'hcd;
      expv[62] = 8'hde;
      expv[63] = 8'h31;
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
