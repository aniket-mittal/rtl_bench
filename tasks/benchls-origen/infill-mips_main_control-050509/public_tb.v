// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050509 dut (
    .opcode(in_vec[7:2]),
    .zero(in_vec[1:1]),
    .sign(in_vec[0:0]),
    .RegWre(out_vec[14:14]),
    .PCWre(out_vec[13:13]),
    .ALUSrcA(out_vec[12:12]),
    .ALUSrcB(out_vec[11:11]),
    .ALUOp(out_vec[10:8]),
    .InsMemRW(out_vec[7:7]),
    .DBDataSrc(out_vec[6:6]),
    .RegDst(out_vec[5:5]),
    .NRD(out_vec[4:4]),
    .NWR(out_vec[3:3]),
    .PCSrc(out_vec[2:1]),
    .ExtSel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h80;
    stim[1] = 8'h5b;
    stim[2] = 8'h4f;
    stim[3] = 8'h94;
    stim[4] = 8'h6c;
    stim[5] = 8'h1b;
    stim[6] = 8'h7d;
    stim[7] = 8'hee;
    stim[8] = 8'ha0;
    stim[9] = 8'ha3;
    stim[10] = 8'h1f;
    stim[11] = 8'h40;
    stim[12] = 8'h65;
    stim[13] = 8'hf1;
    stim[14] = 8'he7;
    stim[15] = 8'h0c;
    stim[16] = 8'ha9;
    stim[17] = 8'haa;
    stim[18] = 8'h65;
    stim[19] = 8'he4;
    stim[20] = 8'hb8;
    stim[21] = 8'hbc;
    stim[22] = 8'ha9;
    stim[23] = 8'h5e;
    stim[24] = 8'hf8;
    stim[25] = 8'h20;
    stim[26] = 8'h07;
    stim[27] = 8'hc9;
    stim[28] = 8'h51;
    stim[29] = 8'hf0;
    stim[30] = 8'h85;
    stim[31] = 8'hee;
    stim[32] = 8'ha5;
    stim[33] = 8'h64;
    stim[34] = 8'h45;
    stim[35] = 8'h4a;
    stim[36] = 8'hf1;
    stim[37] = 8'hac;
    stim[38] = 8'h8b;
    stim[39] = 8'heb;
    stim[40] = 8'h15;
    stim[41] = 8'hfd;
    stim[42] = 8'h37;
    stim[43] = 8'h44;
    stim[44] = 8'haf;
    stim[45] = 8'hea;
    stim[46] = 8'h16;
    stim[47] = 8'h23;
    stim[48] = 8'hc5;
    stim[49] = 8'h0e;
    stim[50] = 8'hc1;
    stim[51] = 8'hb9;
    stim[52] = 8'h62;
    stim[53] = 8'ha1;
    stim[54] = 8'h95;
    stim[55] = 8'h36;
    stim[56] = 8'h2a;
    stim[57] = 8'h62;
    stim[58] = 8'h27;
    stim[59] = 8'h23;
    stim[60] = 8'h67;
    stim[61] = 8'he6;
    stim[62] = 8'h8e;
    stim[63] = 8'h51;
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
      expv[0] = 15'h2098;
      expv[1] = 15'h2098;
      expv[2] = 15'h2098;
      expv[3] = 15'h2098;
      expv[4] = 15'h2098;
      expv[5] = 15'h2098;
      expv[6] = 15'h2098;
      expv[7] = 15'h2098;
      expv[8] = 15'h2098;
      expv[9] = 15'h2098;
      expv[10] = 15'h2098;
      expv[11] = 15'h2098;
      expv[12] = 15'h2098;
      expv[13] = 15'h2098;
      expv[14] = 15'h2098;
      expv[15] = 15'h60bc;
      expv[16] = 15'h2098;
      expv[17] = 15'h2098;
      expv[18] = 15'h2098;
      expv[19] = 15'h2098;
      expv[20] = 15'h2098;
      expv[21] = 15'h2098;
      expv[22] = 15'h2098;
      expv[23] = 15'h2098;
      expv[24] = 15'h2098;
      expv[25] = 15'h6899;
      expv[26] = 15'h2098;
      expv[27] = 15'h2098;
      expv[28] = 15'h2098;
      expv[29] = 15'h2098;
      expv[30] = 15'h2098;
      expv[31] = 15'h2098;
      expv[32] = 15'h2098;
      expv[33] = 15'h2098;
      expv[34] = 15'h2098;
      expv[35] = 15'h2098;
      expv[36] = 15'h2098;
      expv[37] = 15'h2891;
      expv[38] = 15'h2098;
      expv[39] = 15'h2098;
      expv[40] = 15'h269a;
      expv[41] = 15'h0098;
      expv[42] = 15'h6998;
      expv[43] = 15'h2098;
      expv[44] = 15'h2891;
      expv[45] = 15'h2098;
      expv[46] = 15'h2698;
      expv[47] = 15'h6899;
      expv[48] = 15'h2098;
      expv[49] = 15'h60bc;
      expv[50] = 15'h2098;
      expv[51] = 15'h2098;
      expv[52] = 15'h3498;
      expv[53] = 15'h2098;
      expv[54] = 15'h2098;
      expv[55] = 15'h6998;
      expv[56] = 15'h2098;
      expv[57] = 15'h3498;
      expv[58] = 15'h2098;
      expv[59] = 15'h6899;
      expv[60] = 15'h2098;
      expv[61] = 15'h2098;
      expv[62] = 15'h68c9;
      expv[63] = 15'h2098;
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
