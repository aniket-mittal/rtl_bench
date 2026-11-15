// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_082246 dut (
    .clk(clk),
    .rst(in_vec[4:4]),
    .Enable(in_vec[3:3]),
    .Ready(in_vec[2:2]),
    .Iniciar(in_vec[1:1]),
    .Esc_Fin(in_vec[0:0]),
    .Escribir(out_vec[10:10]),
    .Leer(out_vec[9:9]),
    .Estado_Lectura(out_vec[8:8]),
    .Estado_Escritura(out_vec[7:7]),
    .Estado_Iniciar(out_vec[6:6]),
    .state_reg(out_vec[5:3]),
    .state_next(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h18;
    stim[1] = 5'h14;
    stim[2] = 5'h09;
    stim[3] = 5'h0a;
    stim[4] = 5'h0d;
    stim[5] = 5'h08;
    stim[6] = 5'h07;
    stim[7] = 5'h05;
    stim[8] = 5'h0a;
    stim[9] = 5'h01;
    stim[10] = 5'h07;
    stim[11] = 5'h06;
    stim[12] = 5'h0e;
    stim[13] = 5'h0c;
    stim[14] = 5'h08;
    stim[15] = 5'h02;
    stim[16] = 5'h09;
    stim[17] = 5'h03;
    stim[18] = 5'h08;
    stim[19] = 5'h0d;
    stim[20] = 5'h07;
    stim[21] = 5'h0b;
    stim[22] = 5'h06;
    stim[23] = 5'h01;
    stim[24] = 5'h01;
    stim[25] = 5'h04;
    stim[26] = 5'h09;
    stim[27] = 5'h05;
    stim[28] = 5'h03;
    stim[29] = 5'h06;
    stim[30] = 5'h04;
    stim[31] = 5'h09;
    stim[32] = 5'h06;
    stim[33] = 5'h09;
    stim[34] = 5'h03;
    stim[35] = 5'h0c;
    stim[36] = 5'h0b;
    stim[37] = 5'h0d;
    stim[38] = 5'h0b;
    stim[39] = 5'h0e;
    stim[40] = 5'h0b;
    stim[41] = 5'h0a;
    stim[42] = 5'h02;
    stim[43] = 5'h01;
    stim[44] = 5'h0e;
    stim[45] = 5'h0c;
    stim[46] = 5'h0e;
    stim[47] = 5'h09;
    stim[48] = 5'h0c;
    stim[49] = 5'h03;
    stim[50] = 5'h0f;
    stim[51] = 5'h07;
    stim[52] = 5'h04;
    stim[53] = 5'h03;
    stim[54] = 5'h19;
    stim[55] = 5'h00;
    stim[56] = 5'h07;
    stim[57] = 5'h03;
    stim[58] = 5'h0c;
    stim[59] = 5'h0b;
    stim[60] = 5'h07;
    stim[61] = 5'h05;
    stim[62] = 5'h05;
    stim[63] = 5'h01;
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
      expv[0] = 11'h001;
      expv[1] = 11'h001;
      expv[2] = 11'h001;
      expv[3] = 11'h009;
      expv[4] = 11'h44a;
      expv[5] = 11'h453;
      expv[6] = 11'h31c;
      expv[7] = 11'h022;
      expv[8] = 11'h493;
      expv[9] = 11'h31b;
      expv[10] = 11'h01c;
      expv[11] = 11'h024;
      expv[12] = 11'h4a4;
      expv[13] = 11'h4a4;
      expv[14] = 11'h4a4;
      expv[15] = 11'h4a4;
      expv[16] = 11'h4a2;
      expv[17] = 11'h492;
      expv[18] = 11'h313;
      expv[19] = 11'h31c;
      expv[20] = 11'h022;
      expv[21] = 11'h493;
      expv[22] = 11'h31c;
      expv[23] = 11'h022;
      expv[24] = 11'h492;
      expv[25] = 11'h312;
      expv[26] = 11'h313;
      expv[27] = 11'h31c;
      expv[28] = 11'h022;
      expv[29] = 11'h492;
      expv[30] = 11'h312;
      expv[31] = 11'h313;
      expv[32] = 11'h31c;
      expv[33] = 11'h022;
      expv[34] = 11'h492;
      expv[35] = 11'h313;
      expv[36] = 11'h31b;
      expv[37] = 11'h01c;
      expv[38] = 11'h022;
      expv[39] = 11'h493;
      expv[40] = 11'h31b;
      expv[41] = 11'h01b;
      expv[42] = 11'h01b;
      expv[43] = 11'h01b;
      expv[44] = 11'h01c;
      expv[45] = 11'h024;
      expv[46] = 11'h4a4;
      expv[47] = 11'h4a2;
      expv[48] = 11'h493;
      expv[49] = 11'h31b;
      expv[50] = 11'h01c;
      expv[51] = 11'h022;
      expv[52] = 11'h492;
      expv[53] = 11'h312;
      expv[54] = 11'h001;
      expv[55] = 11'h000;
      expv[56] = 11'h001;
      expv[57] = 11'h009;
      expv[58] = 11'h44a;
      expv[59] = 11'h453;
      expv[60] = 11'h31c;
      expv[61] = 11'h022;
      expv[62] = 11'h492;
      expv[63] = 11'h312;
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
