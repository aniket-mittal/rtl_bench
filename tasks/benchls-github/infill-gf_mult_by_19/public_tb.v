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

  gf_mult_by_19 dut (
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
    stim[0] = 8'h6a;
    stim[1] = 8'h96;
    stim[2] = 8'hf8;
    stim[3] = 8'hda;
    stim[4] = 8'hf1;
    stim[5] = 8'h56;
    stim[6] = 8'h7a;
    stim[7] = 8'haf;
    stim[8] = 8'h85;
    stim[9] = 8'hbd;
    stim[10] = 8'ha7;
    stim[11] = 8'haa;
    stim[12] = 8'h06;
    stim[13] = 8'h5b;
    stim[14] = 8'h00;
    stim[15] = 8'h73;
    stim[16] = 8'hd3;
    stim[17] = 8'ha1;
    stim[18] = 8'hf4;
    stim[19] = 8'h84;
    stim[20] = 8'hc0;
    stim[21] = 8'h14;
    stim[22] = 8'h15;
    stim[23] = 8'h83;
    stim[24] = 8'he8;
    stim[25] = 8'h93;
    stim[26] = 8'h24;
    stim[27] = 8'h58;
    stim[28] = 8'h22;
    stim[29] = 8'h04;
    stim[30] = 8'hd5;
    stim[31] = 8'h79;
    stim[32] = 8'hf6;
    stim[33] = 8'h77;
    stim[34] = 8'h78;
    stim[35] = 8'hbe;
    stim[36] = 8'ha3;
    stim[37] = 8'hf8;
    stim[38] = 8'h87;
    stim[39] = 8'hf6;
    stim[40] = 8'h69;
    stim[41] = 8'h23;
    stim[42] = 8'h6f;
    stim[43] = 8'h1c;
    stim[44] = 8'h77;
    stim[45] = 8'h4b;
    stim[46] = 8'h9f;
    stim[47] = 8'h2a;
    stim[48] = 8'h09;
    stim[49] = 8'h2d;
    stim[50] = 8'h08;
    stim[51] = 8'haf;
    stim[52] = 8'hde;
    stim[53] = 8'h49;
    stim[54] = 8'h90;
    stim[55] = 8'h9e;
    stim[56] = 8'h8c;
    stim[57] = 8'he8;
    stim[58] = 8'hbe;
    stim[59] = 8'h89;
    stim[60] = 8'hbf;
    stim[61] = 8'h33;
    stim[62] = 8'h93;
    stim[63] = 8'h38;
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
      expv[0] = 8'hf3;
      expv[1] = 8'hc7;
      expv[2] = 8'h50;
      expv[3] = 8'h65;
      expv[4] = 8'h81;
      expv[5] = 8'hd5;
      expv[6] = 8'h7e;
      expv[7] = 8'h9c;
      expv[8] = 8'h61;
      expv[9] = 8'h23;
      expv[10] = 8'h54;
      expv[11] = 8'he1;
      expv[12] = 8'h56;
      expv[13] = 8'h60;
      expv[14] = 8'h00;
      expv[15] = 8'haf;
      expv[16] = 8'hb4;
      expv[17] = 8'h02;
      expv[18] = 8'hfc;
      expv[19] = 8'h78;
      expv[20] = 8'h12;
      expv[21] = 8'he9;
      expv[22] = 8'hf0;
      expv[23] = 8'h37;
      expv[24] = 8'hdd;
      expv[25] = 8'hba;
      expv[26] = 8'h63;
      expv[27] = 8'h4b;
      expv[28] = 8'h35;
      expv[29] = 8'h64;
      expv[30] = 8'he2;
      expv[31] = 8'h55;
      expv[32] = 8'hce;
      expv[33] = 8'hcb;
      expv[34] = 8'h4c;
      expv[35] = 8'h08;
      expv[36] = 8'h30;
      expv[37] = 8'h50;
      expv[38] = 8'h53;
      expv[39] = 8'hce;
      expv[40] = 8'hd8;
      expv[41] = 8'h2c;
      expv[42] = 8'h8e;
      expv[43] = 8'h21;
      expv[44] = 8'hcb;
      expv[45] = 8'hed;
      expv[46] = 8'h16;
      expv[47] = 8'hfd;
      expv[48] = 8'hd1;
      expv[49] = 8'hb2;
      expv[50] = 8'hc8;
      expv[51] = 8'h9c;
      expv[52] = 8'h01;
      expv[53] = 8'hdf;
      expv[54] = 8'h91;
      expv[55] = 8'h0f;
      expv[56] = 8'hb0;
      expv[57] = 8'hdd;
      expv[58] = 8'h08;
      expv[59] = 8'hcd;
      expv[60] = 8'h11;
      expv[61] = 8'ha1;
      expv[62] = 8'hba;
      expv[63] = 8'h42;
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
