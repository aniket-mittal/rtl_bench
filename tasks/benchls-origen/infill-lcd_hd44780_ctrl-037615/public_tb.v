// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_037615 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .data(in_vec[10:3]),
    .send(in_vec[2:2]),
    .rs_in(in_vec[1:1]),
    .rw_in(in_vec[0:0]),
    .E(out_vec[7:7]),
    .RS(out_vec[6:6]),
    .RW(out_vec[5:5]),
    .D(out_vec[4:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h8f7;
    stim[1] = 12'ha5d;
    stim[2] = 12'h1c3;
    stim[3] = 12'h122;
    stim[4] = 12'h587;
    stim[5] = 12'h610;
    stim[6] = 12'h472;
    stim[7] = 12'h440;
    stim[8] = 12'h20d;
    stim[9] = 12'h7f8;
    stim[10] = 12'h08e;
    stim[11] = 12'h1ca;
    stim[12] = 12'h28f;
    stim[13] = 12'h12c;
    stim[14] = 12'h39e;
    stim[15] = 12'h4f6;
    stim[16] = 12'h760;
    stim[17] = 12'h3be;
    stim[18] = 12'h629;
    stim[19] = 12'h591;
    stim[20] = 12'h136;
    stim[21] = 12'h3f0;
    stim[22] = 12'h5e7;
    stim[23] = 12'h584;
    stim[24] = 12'h4e8;
    stim[25] = 12'h4f8;
    stim[26] = 12'h0c4;
    stim[27] = 12'h5b0;
    stim[28] = 12'h2fb;
    stim[29] = 12'h4c4;
    stim[30] = 12'h3cf;
    stim[31] = 12'h21b;
    stim[32] = 12'h3e4;
    stim[33] = 12'h53e;
    stim[34] = 12'h284;
    stim[35] = 12'h781;
    stim[36] = 12'h631;
    stim[37] = 12'h4e8;
    stim[38] = 12'h017;
    stim[39] = 12'h7a8;
    stim[40] = 12'h61d;
    stim[41] = 12'h57a;
    stim[42] = 12'h6e5;
    stim[43] = 12'h3ca;
    stim[44] = 12'h55c;
    stim[45] = 12'h2b8;
    stim[46] = 12'h1a0;
    stim[47] = 12'h65e;
    stim[48] = 12'h7d3;
    stim[49] = 12'h7a8;
    stim[50] = 12'h168;
    stim[51] = 12'h381;
    stim[52] = 12'h161;
    stim[53] = 12'h3ed;
    stim[54] = 12'h286;
    stim[55] = 12'hf44;
    stim[56] = 12'h58f;
    stim[57] = 12'h054;
    stim[58] = 12'h616;
    stim[59] = 12'h15a;
    stim[60] = 12'h10b;
    stim[61] = 12'h25e;
    stim[62] = 12'h401;
    stim[63] = 12'h78f;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h60;
      expv[6] = 8'h78;
      expv[7] = 8'h70;
      expv[8] = 8'h70;
      expv[9] = 8'h68;
      expv[10] = 8'h7e;
      expv[11] = 8'hfe;
      expv[12] = 8'hfe;
      expv[13] = 8'hfe;
      expv[14] = 8'hfe;
      expv[15] = 8'hfe;
      expv[16] = 8'hfe;
      expv[17] = 8'hfe;
      expv[18] = 8'hfe;
      expv[19] = 8'hfe;
      expv[20] = 8'hfe;
      expv[21] = 8'hfe;
      expv[22] = 8'hfe;
      expv[23] = 8'hfe;
      expv[24] = 8'hfe;
      expv[25] = 8'hfe;
      expv[26] = 8'hfe;
      expv[27] = 8'hfe;
      expv[28] = 8'hfe;
      expv[29] = 8'hfe;
      expv[30] = 8'hfe;
      expv[31] = 8'hfe;
      expv[32] = 8'hfe;
      expv[33] = 8'hfe;
      expv[34] = 8'hfe;
      expv[35] = 8'hfe;
      expv[36] = 8'hfe;
      expv[37] = 8'hfe;
      expv[38] = 8'hfe;
      expv[39] = 8'hfe;
      expv[40] = 8'hfe;
      expv[41] = 8'hfe;
      expv[42] = 8'hfe;
      expv[43] = 8'hfe;
      expv[44] = 8'hfe;
      expv[45] = 8'hfe;
      expv[46] = 8'hfe;
      expv[47] = 8'hfe;
      expv[48] = 8'hfe;
      expv[49] = 8'hfe;
      expv[50] = 8'hfe;
      expv[51] = 8'hfe;
      expv[52] = 8'hfe;
      expv[53] = 8'hfe;
      expv[54] = 8'hfe;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h60;
      expv[58] = 8'h60;
      expv[59] = 8'h78;
      expv[60] = 8'h64;
      expv[61] = 8'h64;
      expv[62] = 8'h68;
      expv[63] = 8'he8;
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
