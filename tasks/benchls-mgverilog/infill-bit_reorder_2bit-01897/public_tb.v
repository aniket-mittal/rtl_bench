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

  mg_01897 dut (
    .din(in_vec[7:0]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb1;
    stim[1] = 8'h00;
    stim[2] = 8'h9e;
    stim[3] = 8'hc1;
    stim[4] = 8'h6a;
    stim[5] = 8'h35;
    stim[6] = 8'hc6;
    stim[7] = 8'hd5;
    stim[8] = 8'hce;
    stim[9] = 8'hdd;
    stim[10] = 8'hf8;
    stim[11] = 8'h18;
    stim[12] = 8'h57;
    stim[13] = 8'h76;
    stim[14] = 8'hf9;
    stim[15] = 8'h95;
    stim[16] = 8'h54;
    stim[17] = 8'h6f;
    stim[18] = 8'h81;
    stim[19] = 8'h5c;
    stim[20] = 8'ha2;
    stim[21] = 8'h9e;
    stim[22] = 8'h1e;
    stim[23] = 8'h84;
    stim[24] = 8'h3c;
    stim[25] = 8'h3a;
    stim[26] = 8'h6b;
    stim[27] = 8'hf5;
    stim[28] = 8'h34;
    stim[29] = 8'h69;
    stim[30] = 8'hfe;
    stim[31] = 8'hb8;
    stim[32] = 8'h8c;
    stim[33] = 8'hfa;
    stim[34] = 8'h6a;
    stim[35] = 8'h4b;
    stim[36] = 8'h5d;
    stim[37] = 8'hd9;
    stim[38] = 8'h7a;
    stim[39] = 8'hdc;
    stim[40] = 8'h34;
    stim[41] = 8'h35;
    stim[42] = 8'h81;
    stim[43] = 8'h40;
    stim[44] = 8'hb1;
    stim[45] = 8'hfc;
    stim[46] = 8'h05;
    stim[47] = 8'hfa;
    stim[48] = 8'hae;
    stim[49] = 8'hd4;
    stim[50] = 8'h0b;
    stim[51] = 8'h36;
    stim[52] = 8'h19;
    stim[53] = 8'hb4;
    stim[54] = 8'hcd;
    stim[55] = 8'h47;
    stim[56] = 8'h07;
    stim[57] = 8'h1c;
    stim[58] = 8'hec;
    stim[59] = 8'h99;
    stim[60] = 8'hd5;
    stim[61] = 8'hb7;
    stim[62] = 8'h47;
    stim[63] = 8'h3a;
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
      expv[0] = 8'h4e;
      expv[1] = 8'h00;
      expv[2] = 8'hb6;
      expv[3] = 8'h43;
      expv[4] = 8'ha9;
      expv[5] = 8'h5c;
      expv[6] = 8'h93;
      expv[7] = 8'h57;
      expv[8] = 8'hb3;
      expv[9] = 8'h77;
      expv[10] = 8'h2f;
      expv[11] = 8'h24;
      expv[12] = 8'hd5;
      expv[13] = 8'h9d;
      expv[14] = 8'h6f;
      expv[15] = 8'h56;
      expv[16] = 8'h15;
      expv[17] = 8'hf9;
      expv[18] = 8'h42;
      expv[19] = 8'h35;
      expv[20] = 8'h8a;
      expv[21] = 8'hb6;
      expv[22] = 8'hb4;
      expv[23] = 8'h12;
      expv[24] = 8'h3c;
      expv[25] = 8'hac;
      expv[26] = 8'he9;
      expv[27] = 8'h5f;
      expv[28] = 8'h1c;
      expv[29] = 8'h69;
      expv[30] = 8'hbf;
      expv[31] = 8'h2e;
      expv[32] = 8'h32;
      expv[33] = 8'haf;
      expv[34] = 8'ha9;
      expv[35] = 8'he1;
      expv[36] = 8'h75;
      expv[37] = 8'h67;
      expv[38] = 8'had;
      expv[39] = 8'h37;
      expv[40] = 8'h1c;
      expv[41] = 8'h5c;
      expv[42] = 8'h42;
      expv[43] = 8'h01;
      expv[44] = 8'h4e;
      expv[45] = 8'h3f;
      expv[46] = 8'h50;
      expv[47] = 8'haf;
      expv[48] = 8'hba;
      expv[49] = 8'h17;
      expv[50] = 8'he0;
      expv[51] = 8'h9c;
      expv[52] = 8'h64;
      expv[53] = 8'h1e;
      expv[54] = 8'h73;
      expv[55] = 8'hd1;
      expv[56] = 8'hd0;
      expv[57] = 8'h34;
      expv[58] = 8'h3b;
      expv[59] = 8'h66;
      expv[60] = 8'h57;
      expv[61] = 8'hde;
      expv[62] = 8'hd1;
      expv[63] = 8'hac;
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
