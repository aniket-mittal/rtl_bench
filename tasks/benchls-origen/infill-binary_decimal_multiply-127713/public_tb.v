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

  origen_127713 dut (
    .input_number(in_vec[7:0]),
    .output_number(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h5e;
    stim[1] = 8'h1e;
    stim[2] = 8'h0b;
    stim[3] = 8'hd4;
    stim[4] = 8'haa;
    stim[5] = 8'h9d;
    stim[6] = 8'hf7;
    stim[7] = 8'hc4;
    stim[8] = 8'hef;
    stim[9] = 8'hbe;
    stim[10] = 8'h63;
    stim[11] = 8'hc7;
    stim[12] = 8'h43;
    stim[13] = 8'h71;
    stim[14] = 8'h32;
    stim[15] = 8'h0a;
    stim[16] = 8'hc3;
    stim[17] = 8'h1f;
    stim[18] = 8'h2a;
    stim[19] = 8'h8b;
    stim[20] = 8'h61;
    stim[21] = 8'hfc;
    stim[22] = 8'h62;
    stim[23] = 8'hf4;
    stim[24] = 8'h7a;
    stim[25] = 8'h1c;
    stim[26] = 8'hb1;
    stim[27] = 8'h5a;
    stim[28] = 8'h19;
    stim[29] = 8'hec;
    stim[30] = 8'h36;
    stim[31] = 8'hb8;
    stim[32] = 8'hb4;
    stim[33] = 8'h00;
    stim[34] = 8'h82;
    stim[35] = 8'h83;
    stim[36] = 8'h36;
    stim[37] = 8'h86;
    stim[38] = 8'h2c;
    stim[39] = 8'hfc;
    stim[40] = 8'h9b;
    stim[41] = 8'hcb;
    stim[42] = 8'h13;
    stim[43] = 8'h37;
    stim[44] = 8'h52;
    stim[45] = 8'hf1;
    stim[46] = 8'hc0;
    stim[47] = 8'hf8;
    stim[48] = 8'h32;
    stim[49] = 8'h84;
    stim[50] = 8'h21;
    stim[51] = 8'h9b;
    stim[52] = 8'hf6;
    stim[53] = 8'h07;
    stim[54] = 8'h91;
    stim[55] = 8'h8f;
    stim[56] = 8'h63;
    stim[57] = 8'h0f;
    stim[58] = 8'h7b;
    stim[59] = 8'h7b;
    stim[60] = 8'hd2;
    stim[61] = 8'h19;
    stim[62] = 8'hdc;
    stim[63] = 8'h97;
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
      expv[0] = 8'h1a;
      expv[1] = 8'h5a;
      expv[2] = 8'h21;
      expv[3] = 8'h7c;
      expv[4] = 8'hfe;
      expv[5] = 8'hd7;
      expv[6] = 8'he5;
      expv[7] = 8'h4c;
      expv[8] = 8'hcd;
      expv[9] = 8'h3a;
      expv[10] = 8'h29;
      expv[11] = 8'h55;
      expv[12] = 8'hc9;
      expv[13] = 8'h53;
      expv[14] = 8'h96;
      expv[15] = 8'h1e;
      expv[16] = 8'h49;
      expv[17] = 8'h5d;
      expv[18] = 8'h7e;
      expv[19] = 8'ha1;
      expv[20] = 8'h23;
      expv[21] = 8'hf4;
      expv[22] = 8'h26;
      expv[23] = 8'hdc;
      expv[24] = 8'h6e;
      expv[25] = 8'h54;
      expv[26] = 8'h13;
      expv[27] = 8'h0e;
      expv[28] = 8'h4b;
      expv[29] = 8'hc4;
      expv[30] = 8'ha2;
      expv[31] = 8'h28;
      expv[32] = 8'h1c;
      expv[33] = 8'h00;
      expv[34] = 8'h86;
      expv[35] = 8'h89;
      expv[36] = 8'ha2;
      expv[37] = 8'h92;
      expv[38] = 8'h84;
      expv[39] = 8'hf4;
      expv[40] = 8'hd1;
      expv[41] = 8'h61;
      expv[42] = 8'h39;
      expv[43] = 8'ha5;
      expv[44] = 8'hf6;
      expv[45] = 8'hd3;
      expv[46] = 8'h40;
      expv[47] = 8'he8;
      expv[48] = 8'h96;
      expv[49] = 8'h8c;
      expv[50] = 8'h63;
      expv[51] = 8'hd1;
      expv[52] = 8'he2;
      expv[53] = 8'h15;
      expv[54] = 8'hb3;
      expv[55] = 8'had;
      expv[56] = 8'h29;
      expv[57] = 8'h2d;
      expv[58] = 8'h71;
      expv[59] = 8'h71;
      expv[60] = 8'h76;
      expv[61] = 8'h4b;
      expv[62] = 8'h94;
      expv[63] = 8'hc5;
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
