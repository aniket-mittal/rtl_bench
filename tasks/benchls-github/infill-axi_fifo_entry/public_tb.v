// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axi_fifo_entry dut (
    .entry_clk(clk),
    .create_en(in_vec[72:72]),
    .data_in(in_vec[71:1]),
    .entry_rst_b(in_vec[0:0]),
    .data_out(out_vec[70:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1dba2736bd5a2057f52;
    stim[1] = 73'h174ebc3aa7f8b9aa74a;
    stim[2] = 73'h0f2d1d43c43980ccfc5;
    stim[3] = 73'h0b78b3c8be22f91394f;
    stim[4] = 73'h0409094f1e779cb55d1;
    stim[5] = 73'h1cb36ff2bd66508494f;
    stim[6] = 73'h18e75cd4c4bd4a3b689;
    stim[7] = 73'h0dcf7981e17f22ee0e1;
    stim[8] = 73'h1567911ed5cca6b964f;
    stim[9] = 73'h07313614014e35cb7e9;
    stim[10] = 73'h144cdfb84119dc9a391;
    stim[11] = 73'h0939ee56cc39f0c2271;
    stim[12] = 73'h13d0c5cbb2cce9b710d;
    stim[13] = 73'h1f148079280f7d1e1a5;
    stim[14] = 73'h02c7402a70628ac2e81;
    stim[15] = 73'h1c60e377c533ab656bf;
    stim[16] = 73'h0ed8b7f79723531eedf;
    stim[17] = 73'h0f8c42de7cb45d42269;
    stim[18] = 73'h001e83d7a32e88d8303;
    stim[19] = 73'h12faa52b71646580e69;
    stim[20] = 73'h0867fae6f518753fce9;
    stim[21] = 73'h0535f1f0621b82a7d7f;
    stim[22] = 73'h0ce8891ab53225008ab;
    stim[23] = 73'h039bf7e61a112a3c769;
    stim[24] = 73'h12e74a84628d923f1a9;
    stim[25] = 73'h0f7067d1cc77841afdd;
    stim[26] = 73'h1617cd0f4cff1f7cdbd;
    stim[27] = 73'h01f4b1c7fef2f286fd1;
    stim[28] = 73'h1e494bd4c6521789349;
    stim[29] = 73'h0065487a87233254795;
    stim[30] = 73'h1b09132fd81b6177bf1;
    stim[31] = 73'h0cab867222d7ab76e01;
    stim[32] = 73'h1dabf1cb25a9cf7cdd3;
    stim[33] = 73'h1e0ba4c3f608c32ec09;
    stim[34] = 73'h07b042e1d156a861983;
    stim[35] = 73'h1b7e052e5785109a125;
    stim[36] = 73'h082a48a01b631403857;
    stim[37] = 73'h086e25126887748c36d;
    stim[38] = 73'h0242e94e1b71301d33d;
    stim[39] = 73'h0590bfdc4cd7be329d7;
    stim[40] = 73'h1b68608b8bf369542f5;
    stim[41] = 73'h1e7a64e4fc2f8dd5909;
    stim[42] = 73'h1287aa7d47ae398511b;
    stim[43] = 73'h0be0cee8af1667ec625;
    stim[44] = 73'h0ecb29907444de546b3;
    stim[45] = 73'h1d0d744a167ce921b7f;
    stim[46] = 73'h1a3c4cc2e0875531027;
    stim[47] = 73'h0557c9c02a50a5e3aeb;
    stim[48] = 73'h02206ca33a140e0dc07;
    stim[49] = 73'h0b327d91aab58d46985;
    stim[50] = 73'h00deaa5b2c4e6d478c5;
    stim[51] = 73'h06714fb99375ac6ca19;
    stim[52] = 73'h112dd0ea675b7480b3b;
    stim[53] = 73'h1e7cf4469ef1948689f;
    stim[54] = 73'h101952719acca934631;
    stim[55] = 73'h1ee2bd8a22bd4bc3c27;
    stim[56] = 73'h0e79918647d695f8d59;
    stim[57] = 73'h12e9140864ef8e425d3;
    stim[58] = 73'h1f9efc44e5fc3bc2913;
    stim[59] = 73'h146f177dfaa59997a75;
    stim[60] = 73'h1dda40f661713e45fd5;
    stim[61] = 73'h025fa93c8cf9c3f8825;
    stim[62] = 73'h190f169d5b6dc205183;
    stim[63] = 73'h0b5cae2e2b65af415f9;
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
      expv[0] = 71'h000000000000000000;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h000000000000000000;
      expv[4] = 71'h000000000000000000;
      expv[5] = 71'h000000000000000000;
      expv[6] = 71'h659b7f95eb328424a7;
      expv[7] = 71'h473ae6a625ea51db44;
      expv[8] = 71'h473ae6a625ea51db44;
      expv[9] = 71'h2b3c88f6ae6535cb27;
      expv[10] = 71'h2b3c88f6ae6535cb27;
      expv[11] = 71'h2266fdc208cee4d1c8;
      expv[12] = 71'h2266fdc208cee4d1c8;
      expv[13] = 71'h1e862e5d96674db886;
      expv[14] = 71'h78a403c9407be8f0d2;
      expv[15] = 71'h78a403c9407be8f0d2;
      expv[16] = 71'h63071bbe299d5b2b5f;
      expv[17] = 71'h63071bbe299d5b2b5f;
      expv[18] = 71'h63071bbe299d5b2b5f;
      expv[19] = 71'h63071bbe299d5b2b5f;
      expv[20] = 71'h17d5295b8b232c0734;
      expv[21] = 71'h17d5295b8b232c0734;
      expv[22] = 71'h17d5295b8b232c0734;
      expv[23] = 71'h17d5295b8b232c0734;
      expv[24] = 71'h17d5295b8b232c0734;
      expv[25] = 71'h173a5423146c91f8d4;
      expv[26] = 71'h173a5423146c91f8d4;
      expv[27] = 71'h30be687a67f8fbe6de;
      expv[28] = 71'h30be687a67f8fbe6de;
      expv[29] = 71'h724a5ea63290bc49a4;
      expv[30] = 71'h724a5ea63290bc49a4;
      expv[31] = 71'h5848997ec0db0bbdf8;
      expv[32] = 71'h5848997ec0db0bbdf8;
      expv[33] = 71'h6d5f8e592d4e7be6e9;
      expv[34] = 71'h705d261fb046197604;
      expv[35] = 71'h705d261fb046197604;
      expv[36] = 71'h5bf02972bc2884d092;
      expv[37] = 71'h5bf02972bc2884d092;
      expv[38] = 71'h5bf02972bc2884d092;
      expv[39] = 71'h5bf02972bc2884d092;
      expv[40] = 71'h5bf02972bc2884d092;
      expv[41] = 71'h5b43045c5f9b4aa17a;
      expv[42] = 71'h73d32727e17c6eac84;
      expv[43] = 71'h143d53ea3d71cc288d;
      expv[44] = 71'h143d53ea3d71cc288d;
      expv[45] = 71'h143d53ea3d71cc288d;
      expv[46] = 71'h686ba250b3e7490dbf;
      expv[47] = 71'h51e26617043aa98813;
      expv[48] = 71'h51e26617043aa98813;
      expv[49] = 71'h51e26617043aa98813;
      expv[50] = 71'h51e26617043aa98813;
      expv[51] = 71'h51e26617043aa98813;
      expv[52] = 71'h51e26617043aa98813;
      expv[53] = 71'h096e87533adba4059d;
      expv[54] = 71'h73e7a234f78ca4344f;
      expv[55] = 71'h00ca938cd66549a318;
      expv[56] = 71'h7715ec5115ea5e1e13;
      expv[57] = 71'h7715ec5115ea5e1e13;
      expv[58] = 71'h1748a043277c7212e9;
      expv[59] = 71'h7cf7e2272fe1de1489;
      expv[60] = 71'h2378bbefd52cccbd3a;
      expv[61] = 71'h6ed207b30b89f22fea;
      expv[62] = 71'h6ed207b30b89f22fea;
      expv[63] = 71'h4878b4eadb6e1028c1;
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
