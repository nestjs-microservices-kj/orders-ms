import { Module } from '@nestjs/common';
import { NatsModule } from './../transports/nats.module';
import { OrdersController } from './orders.controller';
import { OrdersService } from './orders.service';

@Module({
  imports: [NatsModule],
  controllers: [OrdersController],
  providers: [OrdersService],
})
export class OrdersModule {}
