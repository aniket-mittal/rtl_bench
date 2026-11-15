// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 98;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06602 dut (
    .io_mainClk(clk),
    .io_apb_PADDR(in_vec[71:68]),
    .io_apb_PSEL(in_vec[67:67]),
    .io_apb_PENABLE(in_vec[66:66]),
    .io_apb_PWRITE(in_vec[65:65]),
    .io_apb_PWDATA(in_vec[64:33]),
    .io_gpio_read(in_vec[32:1]),
    .resetCtrl_systemReset(in_vec[0:0]),
    .io_apb_PREADY(out_vec[97:97]),
    .io_apb_PRDATA(out_vec[96:65]),
    .io_apb_PSLVERROR(out_vec[64:64]),
    .io_gpio_write(out_vec[63:32]),
    .io_gpio_writeEnable(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h1b46507f61554967f7;
    stim[1] = 72'hb733bce3f920563cad;
    stim[2] = 72'hc504e4d00aebe430b0;
    stim[3] = 72'h03c28be7af36ce174c;
    stim[4] = 72'h66eb0132987cf5065a;
    stim[5] = 72'h32e7fed277f90cbdfc;
    stim[6] = 72'h826c8bb4c4f1d1ebb4;
    stim[7] = 72'h77bc55f8541512e2ec;
    stim[8] = 72'h0650800be0252576fc;
    stim[9] = 72'hdc34ae5b6c6a3ad25c;
    stim[10] = 72'hbc947123db0d03c5cc;
    stim[11] = 72'hf5f0d8a107b230151f;
    stim[12] = 72'hd0d8aa258458e47e06;
    stim[13] = 72'he595938bf4ebbacd9c;
    stim[14] = 72'h9dc3b5ad8228993f38;
    stim[15] = 72'h64597265c1a46be04c;
    stim[16] = 72'hf310017da453fd9752;
    stim[17] = 72'h7c12a3fb7cce3e37da;
    stim[18] = 72'hbf039aed7e537337b6;
    stim[19] = 72'hc97d65f81b87944eda;
    stim[20] = 72'hcfe3605d52bf544a82;
    stim[21] = 72'h231a59444dfe4d2628;
    stim[22] = 72'h3d02af03e8f8b77194;
    stim[23] = 72'h95a4ed7417b44afa5e;
    stim[24] = 72'hf48dd560c29bcf4930;
    stim[25] = 72'h442e0e73c008a69b44;
    stim[26] = 72'he70c1141d5b0587d66;
    stim[27] = 72'hcdd6dbb4c1e4a60c74;
    stim[28] = 72'ha551a35869fd0ad1ba;
    stim[29] = 72'h964626375ba62b9550;
    stim[30] = 72'hf7f7c62b3d73c85836;
    stim[31] = 72'h98e39b8a11b6a47656;
    stim[32] = 72'h5b7b2c8fff73408c7e;
    stim[33] = 72'hf3d0ee10ae9e56d758;
    stim[34] = 72'hb36565665eb5617ff4;
    stim[35] = 72'hef5c06808a2071a0be;
    stim[36] = 72'ha79a8904cd144a6fe4;
    stim[37] = 72'h6d64e7f74375d4e4c4;
    stim[38] = 72'heb73b302d561937f54;
    stim[39] = 72'h7165a2b6d83ee39eaa;
    stim[40] = 72'h273c134bf4a0ad4f62;
    stim[41] = 72'h5659f5450e9f8436d2;
    stim[42] = 72'h4771bbb1de550d6aea;
    stim[43] = 72'h75f699c6f712f19dd4;
    stim[44] = 72'h6a7edabe481e8c0228;
    stim[45] = 72'h6650daa73a6fcaa04a;
    stim[46] = 72'hce84ce15a7605a6fe4;
    stim[47] = 72'h999ee54d0cd9cb648d;
    stim[48] = 72'h43230a89f975a6acac;
    stim[49] = 72'h5535882170bf9c2996;
    stim[50] = 72'h9df134d3a1b94d47a0;
    stim[51] = 72'hdf00b9dc9ae58a9191;
    stim[52] = 72'h0c323de6cfebf16e24;
    stim[53] = 72'hb8cbec71a2e749d614;
    stim[54] = 72'hed23723356d376a636;
    stim[55] = 72'hdcc4d2df4ae89cdb04;
    stim[56] = 72'hd9d2a035216fa2908e;
    stim[57] = 72'he2b0a41a7ccc5befb6;
    stim[58] = 72'hfff973703ae203bc82;
    stim[59] = 72'h0fdc5876f3f5ae9fc2;
    stim[60] = 72'hb0c66d0a49c41b945c;
    stim[61] = 72'h170bf52d81ce6236c6;
    stim[62] = 72'hccfa8792c1cb298a78;
    stim[63] = 72'h1eb6a462d475f08bfc;
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
      expv[0] = 98'h200000000xxxxxxxx00000000;
      expv[1] = 98'h200000000xxxxxxxx00000000;
      expv[2] = 98'h200000000xxxxxxxx00000000;
      expv[3] = 98'h336ce174cxxxxxxxx00000000;
      expv[4] = 98'h200000000xxxxxxxx00000000;
      expv[5] = 98'h200000000xxxxxxxx00000000;
      expv[6] = 98'h200000000xxxxxxxx00000000;
      expv[7] = 98'h200000000xxxxxxxx00000000;
      expv[8] = 98'h2252576fcxxxxxxxx00000000;
      expv[9] = 98'h200000000xxxxxxxx00000000;
      expv[10] = 98'h200000000xxxxxxxx00000000;
      expv[11] = 98'h200000000xxxxxxxx00000000;
      expv[12] = 98'h200000000xxxxxxxx00000000;
      expv[13] = 98'h200000000xxxxxxxx00000000;
      expv[14] = 98'h200000000xxxxxxxx00000000;
      expv[15] = 98'h200000000xxxxxxxx00000000;
      expv[16] = 98'h200000000xxxxxxxx00000000;
      expv[17] = 98'h200000000xxxxxxxx00000000;
      expv[18] = 98'h200000000xxxxxxxx00000000;
      expv[19] = 98'h200000000xxxxxxxx00000000;
      expv[20] = 98'h200000000xxxxxxxx00000000;
      expv[21] = 98'h200000000xxxxxxxx00000000;
      expv[22] = 98'h200000000xxxxxxxx00000000;
      expv[23] = 98'h200000000xxxxxxxx00000000;
      expv[24] = 98'h200000000xxxxxxxx00000000;
      expv[25] = 98'hxxxxxxxxxxxxxxxxx00000000;
      expv[26] = 98'h200000000xxxxxxxx00000000;
      expv[27] = 98'h200000000xxxxxxxx00000000;
      expv[28] = 98'h200000000xxxxxxxx00000000;
      expv[29] = 98'h200000000xxxxxxxx00000000;
      expv[30] = 98'h200000000xxxxxxxx00000000;
      expv[31] = 98'h200000000xxxxxxxx00000000;
      expv[32] = 98'h200000000xxxxxxxx00000000;
      expv[33] = 98'h200000000xxxxxxxx00000000;
      expv[34] = 98'h200000000xxxxxxxx00000000;
      expv[35] = 98'h200000000xxxxxxxx00000000;
      expv[36] = 98'h200000000xxxxxxxx00000000;
      expv[37] = 98'h200000000xxxxxxxx00000000;
      expv[38] = 98'h200000000xxxxxxxx00000000;
      expv[39] = 98'h200000000xxxxxxxx00000000;
      expv[40] = 98'h200000000xxxxxxxx00000000;
      expv[41] = 98'h200000000xxxxxxxx00000000;
      expv[42] = 98'hxxxxxxxxxxxxxxxxx00000000;
      expv[43] = 98'h200000000xxxxxxxx00000000;
      expv[44] = 98'h200000000xxxxxxxx00000000;
      expv[45] = 98'h200000000xxxxxxxx00000000;
      expv[46] = 98'h200000000xxxxxxxx00000000;
      expv[47] = 98'h200000000xxxxxxxx00000000;
      expv[48] = 98'hxxxxxxxxxxxxxxxxx00000000;
      expv[49] = 98'h200000000xxxxxxxx00000000;
      expv[50] = 98'h200000000xxxxxxxx00000000;
      expv[51] = 98'h200000000xxxxxxxx00000000;
      expv[52] = 98'h3ebf16e24xxxxxxxx00000000;
      expv[53] = 98'h200000000xxxxxxxx00000000;
      expv[54] = 98'h200000000xxxxxxxx00000000;
      expv[55] = 98'h200000000xxxxxxxx00000000;
      expv[56] = 98'h200000000xxxxxxxx00000000;
      expv[57] = 98'h200000000xxxxxxxx00000000;
      expv[58] = 98'h200000000xxxxxxxx00000000;
      expv[59] = 98'h3f5ae9fc2xxxxxxxx00000000;
      expv[60] = 98'h200000000xxxxxxxx00000000;
      expv[61] = 98'h200000000xxxxxxxx00000000;
      expv[62] = 98'h200000000xxxxxxxx00000000;
      expv[63] = 98'h200000000xxxxxxxx00000000;
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
