// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_069339 dut (
    .in_interface(in_vec[32:1]),
    .valid_in_interface(in_vec[0:0]),
    .degree_in(out_vec[50:35]),
    .x_in(out_vec[34:19]),
    .y_in(out_vec[18:3]),
    .flip_in(out_vec[2:2]),
    .arctan_en_in(out_vec[1:1]),
    .valid_in(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h19f157bcc;
    stim[1] = 33'h0bed68ec0;
    stim[2] = 33'h196f7d88f;
    stim[3] = 33'h19034bb70;
    stim[4] = 33'h1bb59a047;
    stim[5] = 33'h0c597696c;
    stim[6] = 33'h02f590dd4;
    stim[7] = 33'h0decb4508;
    stim[8] = 33'h00dece596;
    stim[9] = 33'h0f42a8aba;
    stim[10] = 33'h1cb935537;
    stim[11] = 33'h1e56fa342;
    stim[12] = 33'h01b6f998f;
    stim[13] = 33'h0f81c01b3;
    stim[14] = 33'h104390af0;
    stim[15] = 33'h0175859d4;
    stim[16] = 33'h15c63a7d1;
    stim[17] = 33'h0b3b9692d;
    stim[18] = 33'h0a57bda6a;
    stim[19] = 33'h1bf25b3be;
    stim[20] = 33'h1ea51e157;
    stim[21] = 33'h1a120b0e1;
    stim[22] = 33'h1e519ed15;
    stim[23] = 33'h0cdaadafd;
    stim[24] = 33'h0edb92e53;
    stim[25] = 33'h18770c063;
    stim[26] = 33'h0072bd18d;
    stim[27] = 33'h18f002cf5;
    stim[28] = 33'h0bef1651f;
    stim[29] = 33'h091d4ee3a;
    stim[30] = 33'h0421ba760;
    stim[31] = 33'h12c64e495;
    stim[32] = 33'h09102f3c5;
    stim[33] = 33'h1971b8da4;
    stim[34] = 33'h161177aeb;
    stim[35] = 33'h1106abd39;
    stim[36] = 33'h19952821b;
    stim[37] = 33'h087dd47e6;
    stim[38] = 33'h078819707;
    stim[39] = 33'h09a867119;
    stim[40] = 33'h0896e77fb;
    stim[41] = 33'h0715fe1fd;
    stim[42] = 33'h092f31113;
    stim[43] = 33'h110586ede;
    stim[44] = 33'h056ce8c30;
    stim[45] = 33'h04189f77f;
    stim[46] = 33'h021e0fce4;
    stim[47] = 33'h097fe3169;
    stim[48] = 33'h0b14d285c;
    stim[49] = 33'h001c0fe9f;
    stim[50] = 33'h0fe642e9d;
    stim[51] = 33'h180d92737;
    stim[52] = 33'h1dc0f67c2;
    stim[53] = 33'h04cae1032;
    stim[54] = 33'h03787a114;
    stim[55] = 33'h1fadb4f87;
    stim[56] = 33'h1cd49a94d;
    stim[57] = 33'h05966a0ab;
    stim[58] = 33'h14dac8fc5;
    stim[59] = 33'h189fb5690;
    stim[60] = 33'h091df25d2;
    stim[61] = 33'h12d9bdd86;
    stim[62] = 33'h04cab8fd2;
    stim[63] = 33'h03a690dde;
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
      expv[0] = 51'h5ef300805ef30;
      expv[1] = 51'h23b0008023b02;
      expv[2] = 51'h762380807623b;
      expv[3] = 51'h01dc00802edc4;
      expv[4] = 51'h6811808068119;
      expv[5] = 51'h5a5b00805a5b2;
      expv[6] = 51'h7075008043754;
      expv[7] = 51'h7e42008051426;
      expv[8] = 51'h0c6580803965c;
      expv[9] = 51'h22ae808022aea;
      expv[10] = 51'h554d8080554db;
      expv[11] = 51'h68d0808068d0a;
      expv[12] = 51'h666380806663b;
      expv[13] = 51'h006c8080006c9;
      expv[14] = 51'h6fbc008042bc4;
      expv[15] = 51'h1675008016750;
      expv[16] = 51'h69f4008069f43;
      expv[17] = 51'h5a4b00805a4b1;
      expv[18] = 51'h769a8080769aa;
      expv[19] = 51'h6cef80806cef8;
      expv[20] = 51'h7855808078559;
      expv[21] = 51'h2c3800802c381;
      expv[22] = 51'h7b4500807b451;
      expv[23] = 51'h09bf008036bf7;
      expv[24] = 51'h789480804b94d;
      expv[25] = 51'h031880803018d;
      expv[26] = 51'h7463008074633;
      expv[27] = 51'h0b3d00800b3d1;
      expv[28] = 51'h5947808059479;
      expv[29] = 51'h0e8e80803b8ec;
      expv[30] = 51'h69d8008069d82;
      expv[31] = 51'h0c25008039255;
      expv[32] = 51'h0ff100803cf17;
      expv[33] = 51'h6369008063692;
      expv[34] = 51'h5eba80805ebab;
      expv[35] = 51'h024e00802f4e7;
      expv[36] = 51'h208680802086b;
      expv[37] = 51'h7ef9808051f9c;
      expv[38] = 51'h65c1808065c19;
      expv[39] = 51'h1c4600801c463;
      expv[40] = 51'h1dfe80801dfeb;
      expv[41] = 51'h787f0080787f3;
      expv[42] = 51'h714480804444f;
      expv[43] = 51'h1bb780801bb78;
      expv[44] = 51'h230c0080230c2;
      expv[45] = 51'h7ddf80807ddf9;
      expv[46] = 51'h123900803f394;
      expv[47] = 51'h0c5a00800c5a3;
      expv[48] = 51'h771700804a174;
      expv[49] = 51'h12a780803fa7d;
      expv[50] = 51'h0ba700800ba71;
      expv[51] = 51'h76cd808049cdd;
      expv[52] = 51'h59f0808059f0a;
      expv[53] = 51'h040c8080040ca;
      expv[54] = 51'h6845008068452;
      expv[55] = 51'h53e1808053e1b;
      expv[56] = 51'h6a5300806a531;
      expv[57] = 51'h282a8080282ab;
      expv[58] = 51'h23f1008023f11;
      expv[59] = 51'h55a4008055a42;
      expv[60] = 51'h767480804974e;
      expv[61] = 51'h776180807761a;
      expv[62] = 51'h63f4808063f4a;
      expv[63] = 51'h707780804377c;
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
