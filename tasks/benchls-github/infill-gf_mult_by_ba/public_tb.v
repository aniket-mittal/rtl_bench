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

  gf_mult_by_ba dut (
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
    stim[0] = 8'h17;
    stim[1] = 8'h4e;
    stim[2] = 8'h2d;
    stim[3] = 8'h38;
    stim[4] = 8'hfa;
    stim[5] = 8'h76;
    stim[6] = 8'h27;
    stim[7] = 8'h06;
    stim[8] = 8'h09;
    stim[9] = 8'h34;
    stim[10] = 8'ha2;
    stim[11] = 8'h19;
    stim[12] = 8'hc0;
    stim[13] = 8'hb0;
    stim[14] = 8'h42;
    stim[15] = 8'he1;
    stim[16] = 8'h2e;
    stim[17] = 8'h01;
    stim[18] = 8'h56;
    stim[19] = 8'hdd;
    stim[20] = 8'h29;
    stim[21] = 8'hbd;
    stim[22] = 8'ha8;
    stim[23] = 8'h12;
    stim[24] = 8'ha4;
    stim[25] = 8'h4e;
    stim[26] = 8'hdf;
    stim[27] = 8'hbe;
    stim[28] = 8'hac;
    stim[29] = 8'hbf;
    stim[30] = 8'h3e;
    stim[31] = 8'hd4;
    stim[32] = 8'he1;
    stim[33] = 8'hf4;
    stim[34] = 8'h89;
    stim[35] = 8'h4c;
    stim[36] = 8'hdc;
    stim[37] = 8'h23;
    stim[38] = 8'h08;
    stim[39] = 8'he8;
    stim[40] = 8'hf6;
    stim[41] = 8'h65;
    stim[42] = 8'h83;
    stim[43] = 8'h76;
    stim[44] = 8'h0c;
    stim[45] = 8'hb2;
    stim[46] = 8'h09;
    stim[47] = 8'h2f;
    stim[48] = 8'h6d;
    stim[49] = 8'h3a;
    stim[50] = 8'hfd;
    stim[51] = 8'h76;
    stim[52] = 8'h33;
    stim[53] = 8'h56;
    stim[54] = 8'h5a;
    stim[55] = 8'hac;
    stim[56] = 8'h12;
    stim[57] = 8'h5c;
    stim[58] = 8'h57;
    stim[59] = 8'h5e;
    stim[60] = 8'h12;
    stim[61] = 8'h94;
    stim[62] = 8'h60;
    stim[63] = 8'hcf;
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
      expv[0] = 8'h6e;
      expv[1] = 8'ha3;
      expv[2] = 8'h0f;
      expv[3] = 8'h08;
      expv[4] = 8'h9f;
      expv[5] = 8'hab;
      expv[6] = 8'hdf;
      expv[7] = 8'hbb;
      expv[8] = 8'h03;
      expv[9] = 8'h63;
      expv[10] = 8'he8;
      expv[11] = 8'h6c;
      expv[12] = 8'hfe;
      expv[13] = 8'hee;
      expv[14] = 8'hc8;
      expv[15] = 8'h9a;
      expv[16] = 8'hdc;
      expv[17] = 8'hba;
      expv[18] = 8'h75;
      expv[19] = 8'h40;
      expv[20] = 8'hdd;
      expv[21] = 8'h3f;
      expv[22] = 8'h38;
      expv[23] = 8'h06;
      expv[24] = 8'h53;
      expv[25] = 8'ha3;
      expv[26] = 8'h29;
      expv[27] = 8'hec;
      expv[28] = 8'hea;
      expv[29] = 8'h56;
      expv[30] = 8'hb3;
      expv[31] = 8'h43;
      expv[32] = 8'h9a;
      expv[33] = 8'h9d;
      expv[34] = 8'h5c;
      expv[35] = 8'hca;
      expv[36] = 8'hfa;
      expv[37] = 8'h0d;
      expv[38] = 8'hb9;
      expv[39] = 8'h99;
      expv[40] = 8'hf4;
      expv[41] = 8'h17;
      expv[42] = 8'h8c;
      expv[43] = 8'hab;
      expv[44] = 8'h6b;
      expv[45] = 8'h87;
      expv[46] = 8'h03;
      expv[47] = 8'h66;
      expv[48] = 8'hae;
      expv[49] = 8'h61;
      expv[50] = 8'h9e;
      expv[51] = 8'hab;
      expv[52] = 8'h62;
      expv[53] = 8'h75;
      expv[54] = 8'h1e;
      expv[55] = 8'hea;
      expv[56] = 8'h06;
      expv[57] = 8'ha5;
      expv[58] = 8'hcf;
      expv[59] = 8'hcc;
      expv[60] = 8'h06;
      expv[61] = 8'he2;
      expv[62] = 8'h7f;
      expv[63] = 8'h46;
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
