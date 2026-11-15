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

  gf_mult_by_34 dut (
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
    stim[0] = 8'h63;
    stim[1] = 8'h8e;
    stim[2] = 8'hcc;
    stim[3] = 8'hc5;
    stim[4] = 8'h60;
    stim[5] = 8'h62;
    stim[6] = 8'hda;
    stim[7] = 8'h73;
    stim[8] = 8'hd5;
    stim[9] = 8'hbe;
    stim[10] = 8'h19;
    stim[11] = 8'h69;
    stim[12] = 8'h4f;
    stim[13] = 8'hfa;
    stim[14] = 8'hd7;
    stim[15] = 8'h97;
    stim[16] = 8'h2b;
    stim[17] = 8'hf3;
    stim[18] = 8'h92;
    stim[19] = 8'h02;
    stim[20] = 8'ha1;
    stim[21] = 8'h3c;
    stim[22] = 8'hb9;
    stim[23] = 8'h78;
    stim[24] = 8'h29;
    stim[25] = 8'h81;
    stim[26] = 8'he7;
    stim[27] = 8'ha2;
    stim[28] = 8'hd6;
    stim[29] = 8'h20;
    stim[30] = 8'ha3;
    stim[31] = 8'h20;
    stim[32] = 8'h96;
    stim[33] = 8'hcd;
    stim[34] = 8'h08;
    stim[35] = 8'h39;
    stim[36] = 8'ha3;
    stim[37] = 8'h69;
    stim[38] = 8'h14;
    stim[39] = 8'hf2;
    stim[40] = 8'h4a;
    stim[41] = 8'h0d;
    stim[42] = 8'hd2;
    stim[43] = 8'h07;
    stim[44] = 8'h37;
    stim[45] = 8'hfe;
    stim[46] = 8'h75;
    stim[47] = 8'h24;
    stim[48] = 8'h49;
    stim[49] = 8'had;
    stim[50] = 8'hbe;
    stim[51] = 8'h34;
    stim[52] = 8'h37;
    stim[53] = 8'h6c;
    stim[54] = 8'h9d;
    stim[55] = 8'heb;
    stim[56] = 8'h3f;
    stim[57] = 8'hcd;
    stim[58] = 8'h84;
    stim[59] = 8'h6a;
    stim[60] = 8'hc2;
    stim[61] = 8'h43;
    stim[62] = 8'hb7;
    stim[63] = 8'h72;
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
      expv[0] = 8'h13;
      expv[1] = 8'h1a;
      expv[2] = 8'hf3;
      expv[3] = 8'h7a;
      expv[4] = 8'h4f;
      expv[5] = 8'h27;
      expv[6] = 8'h2c;
      expv[7] = 8'h74;
      expv[8] = 8'h1d;
      expv[9] = 8'hb3;
      expv[10] = 8'hee;
      expv[11] = 8'hc6;
      expv[12] = 8'hb0;
      expv[13] = 8'he2;
      expv[14] = 8'h75;
      expv[15] = 8'hf4;
      expv[16] = 8'h2f;
      expv[17] = 8'h6b;
      expv[18] = 8'h10;
      expv[19] = 8'h68;
      expv[20] = 8'he5;
      expv[21] = 8'hc4;
      expv[22] = 8'h3f;
      expv[23] = 8'h95;
      expv[24] = 8'h47;
      expv[25] = 8'h2b;
      expv[26] = 8'hdc;
      expv[27] = 8'hb9;
      expv[28] = 8'h41;
      expv[29] = 8'hce;
      expv[30] = 8'h8d;
      expv[31] = 8'hce;
      expv[32] = 8'hc0;
      expv[33] = 8'hc7;
      expv[34] = 8'hbd;
      expv[35] = 8'h20;
      expv[36] = 8'h8d;
      expv[37] = 8'hc6;
      expv[38] = 8'hb7;
      expv[39] = 8'h5f;
      expv[40] = 8'h54;
      expv[41] = 8'h59;
      expv[42] = 8'h91;
      expv[43] = 8'h8c;
      expv[44] = 8'h25;
      expv[45] = 8'h32;
      expv[46] = 8'hcc;
      expv[47] = 8'h1e;
      expv[48] = 8'h08;
      expv[49] = 8'h88;
      expv[50] = 8'hb3;
      expv[51] = 8'h79;
      expv[52] = 8'h25;
      expv[53] = 8'h22;
      expv[54] = 8'h21;
      expv[55] = 8'hb1;
      expv[56] = 8'h98;
      expv[57] = 8'hc7;
      expv[58] = 8'hcf;
      expv[59] = 8'h9a;
      expv[60] = 8'hf6;
      expv[61] = 8'hdd;
      expv[62] = 8'h3a;
      expv[63] = 8'h40;
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
