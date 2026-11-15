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

  gf_mult_by_21 dut (
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
    stim[0] = 8'h6f;
    stim[1] = 8'h09;
    stim[2] = 8'h54;
    stim[3] = 8'h1a;
    stim[4] = 8'h56;
    stim[5] = 8'h18;
    stim[6] = 8'hdd;
    stim[7] = 8'h88;
    stim[8] = 8'h21;
    stim[9] = 8'hef;
    stim[10] = 8'h67;
    stim[11] = 8'h63;
    stim[12] = 8'h1e;
    stim[13] = 8'hd6;
    stim[14] = 8'hbe;
    stim[15] = 8'h65;
    stim[16] = 8'h70;
    stim[17] = 8'h63;
    stim[18] = 8'h8e;
    stim[19] = 8'hda;
    stim[20] = 8'ha2;
    stim[21] = 8'hed;
    stim[22] = 8'hdf;
    stim[23] = 8'h48;
    stim[24] = 8'h14;
    stim[25] = 8'h17;
    stim[26] = 8'h1d;
    stim[27] = 8'hb1;
    stim[28] = 8'h5f;
    stim[29] = 8'hba;
    stim[30] = 8'h7b;
    stim[31] = 8'h45;
    stim[32] = 8'h87;
    stim[33] = 8'h59;
    stim[34] = 8'h0e;
    stim[35] = 8'h2b;
    stim[36] = 8'h5a;
    stim[37] = 8'hae;
    stim[38] = 8'hd0;
    stim[39] = 8'h39;
    stim[40] = 8'h82;
    stim[41] = 8'h61;
    stim[42] = 8'h49;
    stim[43] = 8'h68;
    stim[44] = 8'h84;
    stim[45] = 8'hba;
    stim[46] = 8'hca;
    stim[47] = 8'h1d;
    stim[48] = 8'h76;
    stim[49] = 8'h50;
    stim[50] = 8'he7;
    stim[51] = 8'hdf;
    stim[52] = 8'h01;
    stim[53] = 8'hfa;
    stim[54] = 8'hf7;
    stim[55] = 8'h55;
    stim[56] = 8'he5;
    stim[57] = 8'h08;
    stim[58] = 8'h45;
    stim[59] = 8'hdc;
    stim[60] = 8'ha4;
    stim[61] = 8'h18;
    stim[62] = 8'h3c;
    stim[63] = 8'hcc;
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
      expv[0] = 8'h0e;
      expv[1] = 8'h34;
      expv[2] = 8'h06;
      expv[3] = 8'h7d;
      expv[4] = 8'h44;
      expv[5] = 8'h3f;
      expv[6] = 8'h7f;
      expv[7] = 8'h58;
      expv[8] = 8'h75;
      expv[9] = 8'h43;
      expv[10] = 8'h1b;
      expv[11] = 8'h9f;
      expv[12] = 8'hf9;
      expv[13] = 8'h09;
      expv[14] = 8'he0;
      expv[15] = 8'h59;
      expv[16] = 8'hd6;
      expv[17] = 8'h9f;
      expv[18] = 8'h9e;
      expv[19] = 8'h98;
      expv[20] = 8'h5b;
      expv[21] = 8'h01;
      expv[22] = 8'h3d;
      expv[23] = 8'hbd;
      expv[24] = 8'hae;
      expv[25] = 8'hcd;
      expv[26] = 8'h9a;
      expv[27] = 8'h12;
      expv[28] = 8'h70;
      expv[29] = 8'h64;
      expv[30] = 8'ha0;
      expv[31] = 8'h0d;
      expv[32] = 8'haa;
      expv[33] = 8'hb6;
      expv[34] = 8'hd3;
      expv[35] = 8'h22;
      expv[36] = 8'hd5;
      expv[37] = 8'hca;
      expv[38] = 8'hcf;
      expv[39] = 8'h4a;
      expv[40] = 8'h0f;
      expv[41] = 8'hdd;
      expv[42] = 8'h9c;
      expv[43] = 8'he9;
      expv[44] = 8'hc9;
      expv[45] = 8'h64;
      expv[46] = 8'hb2;
      expv[47] = 8'h9a;
      expv[48] = 8'h10;
      expv[49] = 8'h82;
      expv[50] = 8'h56;
      expv[51] = 8'h3d;
      expv[52] = 8'h21;
      expv[53] = 8'hcc;
      expv[54] = 8'h7c;
      expv[55] = 8'h27;
      expv[56] = 8'h14;
      expv[57] = 8'h15;
      expv[58] = 8'h0d;
      expv[59] = 8'h5e;
      expv[60] = 8'h9d;
      expv[61] = 8'h3f;
      expv[62] = 8'hef;
      expv[63] = 8'h74;
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
