// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  part5 dut (
    .SW(in_vec[20:3]),
    .KEY(in_vec[2:0]),
    .LEDR(out_vec[27:10]),
    .LEDG(out_vec[9:7]),
    .HEX0(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0d7bb5;
    stim[1] = 21'h1cf27a;
    stim[2] = 21'h0b229c;
    stim[3] = 21'h1c3701;
    stim[4] = 21'h0fdff4;
    stim[5] = 21'h038c27;
    stim[6] = 21'h05f72e;
    stim[7] = 21'h02aa4d;
    stim[8] = 21'h0f7dba;
    stim[9] = 21'h158adb;
    stim[10] = 21'h18e604;
    stim[11] = 21'h13de3e;
    stim[12] = 21'h0cca02;
    stim[13] = 21'h09b0da;
    stim[14] = 21'h051b47;
    stim[15] = 21'h158182;
    stim[16] = 21'h101727;
    stim[17] = 21'h093d6c;
    stim[18] = 21'h1ba6f3;
    stim[19] = 21'h032550;
    stim[20] = 21'h08cce9;
    stim[21] = 21'h0a2e86;
    stim[22] = 21'h0588ff;
    stim[23] = 21'h0ed061;
    stim[24] = 21'h1931ee;
    stim[25] = 21'h017681;
    stim[26] = 21'h129367;
    stim[27] = 21'h11053b;
    stim[28] = 21'h0e48e0;
    stim[29] = 21'h098f58;
    stim[30] = 21'h1749ce;
    stim[31] = 21'h06471a;
    stim[32] = 21'h11d535;
    stim[33] = 21'h0b384d;
    stim[34] = 21'h17165d;
    stim[35] = 21'h1fbdf0;
    stim[36] = 21'h11458a;
    stim[37] = 21'h0485d1;
    stim[38] = 21'h140abc;
    stim[39] = 21'h1e8d07;
    stim[40] = 21'h1c2c7f;
    stim[41] = 21'h0ce63e;
    stim[42] = 21'h0b035c;
    stim[43] = 21'h095fbc;
    stim[44] = 21'h0fda7b;
    stim[45] = 21'h04ebc3;
    stim[46] = 21'h0123c9;
    stim[47] = 21'h05b79b;
    stim[48] = 21'h0c9cd9;
    stim[49] = 21'h12b147;
    stim[50] = 21'h018224;
    stim[51] = 21'h1c081b;
    stim[52] = 21'h1ad57f;
    stim[53] = 21'h0c79a5;
    stim[54] = 21'h133903;
    stim[55] = 21'h100f05;
    stim[56] = 21'h1db846;
    stim[57] = 21'h09d406;
    stim[58] = 21'h15391c;
    stim[59] = 21'h1f4d8b;
    stim[60] = 21'h17da07;
    stim[61] = 21'h136ae9;
    stim[62] = 21'h12680a;
    stim[63] = 21'h155727;
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
      expv[0] = 28'h6bddb00;
      expv[1] = 28'he793f80;
      expv[2] = 28'h5914d76;
      expv[3] = 28'he1b8039;
      expv[4] = 28'h7effb80;
      expv[5] = 28'h1c61039;
      expv[6] = 28'h2fb9439;
      expv[7] = 28'h15524f9;
      expv[8] = 28'h7bedf80;
      expv[9] = 28'hac56e87;
      expv[10] = 28'hc730039;
      expv[11] = 28'h9ef1c39;
      expv[12] = 28'h665027c;
      expv[13] = 28'h4d86df0;
      expv[14] = 28'h28da039;
      expv[15] = 28'hac0c039;
      expv[16] = 28'h80b9039;
      expv[17] = 28'h49eb687;
      expv[18] = 28'hdd379f0;
      expv[19] = 28'h192a839;
      expv[20] = 28'h46674f9;
      expv[21] = 28'h5174039;
      expv[22] = 28'h2c47c39;
      expv[23] = 28'h7683287;
      expv[24] = 28'hc98f439;
      expv[25] = 28'h0bb4176;
      expv[26] = 28'h949b039;
      expv[27] = 28'h8829d76;
      expv[28] = 28'h72471f0;
      expv[29] = 28'h4c7ad76;
      expv[30] = 28'hba4e439;
      expv[31] = 28'h3238e7c;
      expv[32] = 28'h8ea9b00;
      expv[33] = 28'h59c24f9;
      expv[34] = 28'hb8b2df0;
      expv[35] = 28'hfdefb80;
      expv[36] = 28'h8a2c67c;
      expv[37] = 28'h242e8f9;
      expv[38] = 28'ha055d76;
      expv[39] = 28'hf468039;
      expv[40] = 28'he163c39;
      expv[41] = 28'h6731c39;
      expv[42] = 28'h581ae87;
      expv[43] = 28'h4afdf00;
      expv[44] = 28'h7ed3e87;
      expv[45] = 28'h275e287;
      expv[46] = 28'h091e576;
      expv[47] = 28'h2dbcdf0;
      expv[48] = 28'h64e6cf9;
      expv[49] = 28'h958a039;
      expv[50] = 28'h0c11039;
      expv[51] = 28'he040e7c;
      expv[52] = 28'hd6abc39;
      expv[53] = 28'h63cd27c;
      expv[54] = 28'h99c827c;
      expv[55] = 28'h8078039;
      expv[56] = 28'hedc2039;
      expv[57] = 28'h4ea0039;
      expv[58] = 28'ha9c8e7c;
      expv[59] = 28'hfa6c700;
      expv[60] = 28'hbed0039;
      expv[61] = 28'h9b57700;
      expv[62] = 28'h9340700;
      expv[63] = 28'haab9039;
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
